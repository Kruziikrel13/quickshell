import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Hyprland
import "../.."

Loader {
  active: Hyprland.workspaces.values.length > 0
  anchors.verticalCenter: parent.verticalCenter
  sourceComponent: WrapperItem {
    Component.onCompleted: [ Hyprland.refreshWorkspaces() ]

    Connections {
      target: Hyprland
      function onRawEvent(event) {
        if (event in [
          "activewindow", "focusedmon", "monitoradded", 
          "createworkspace", "destroyworkspace", "moveworkspace", 
          "activespecial", "movewindow", "windowtitle"
        ]) return;
        Hyprland.refreshWorkspaces()
      }
    }

    RowLayout {
      spacing: 5
      Repeater {
        model: Hyprland.workspaces
        WrapperMouseArea {
          required property HyprlandWorkspace modelData
          onClicked: modelData.activate()
          Rectangle {
            implicitHeight: {
              if (modelData.focused || modelData.lastIpcObject.windows > 0) return ShellGlobals.sizes.icons.normal
              return ShellGlobals.sizes.icons.normal - (ShellGlobals.sizes.icons.normal / 4)
            }
            implicitWidth: {
              if (modelData.focused && modelData.lastIpcObject.windows > 0) return ShellGlobals.sizes.icons.normal * 2
              if (modelData.lastIpcObject.windows > 0) return ShellGlobals.sizes.icons.normal
              return ShellGlobals.sizes.icons.normal - (ShellGlobals.sizes.icons.normal / 4)
            }
            color: {
              if (modelData.focused) return ShellGlobals.colors.primary
              if (modelData.lastIpcObject.windows > 0) return ShellGlobals.colors.onbackground
              return ShellGlobals.colors.secondary
            }
            radius: modelData.focused ? 2.5 : 10
            Behavior on implicitWidth {
              NumberAnimation {
                duration: 100
                easing.type: Easing.Linear
              }
            }
            Behavior on implicitHeight {
              NumberAnimation {
                duration: 100
                easing.type: Easing.Linear
              }
            }
          }
        }
      }
    }
  }
}
