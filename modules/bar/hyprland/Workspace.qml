//@ pragma Internal
import qs
import QtQuick
import Quickshell.Hyprland
import Quickshell.Widgets

WrapperMouseArea {
  id: root
  required property HyprlandWorkspace modelData
  onClicked: modelData.activate()
  Rectangle {
    readonly property bool empty: root.modelData.toplevels.values.length <= 0
    readonly property bool focused: root.modelData.focused

    implicitHeight: (focused || !empty) ? ShellGlobals.sizes.icons.normal : ShellGlobals.sizes.icons.normal * 0.75
    implicitWidth: {
      if (focused && !empty)
        return ShellGlobals.sizes.icons.normal * 2;
      if (!empty)
        return ShellGlobals.sizes.icons.normal;
      return ShellGlobals.sizes.icons.normal * 0.75;
    }
    color: {
      if (focused)
        return ShellGlobals.colors.primary;
      if (!empty)
        return ShellGlobals.colors.onbackground;
      return ShellGlobals.colors.secondary;
    }

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
