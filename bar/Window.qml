import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "hyprland" as Hyprland
import qs

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: window
      required property ShellScreen modelData
      screen: modelData

      implicitHeight: ShellGlobals.sizes.barHeight
      color: ShellGlobals.colors.background

      mask: Region {
        width: window.width
        height: window.exclusiveZone
      }

      anchors {
        left: true
        right: true
        top: true
      }

      RowLayout {
        anchors.fill: parent
        spacing: 0
        ModuleGroup {
          Hyprland.Workspaces {}
          Hyprland.ActiveClient {}
        }
        ModuleGroup {
          center: true
          Clock {}
        }
        ModuleGroup {
          layoutDirection: Qt.RightToLeft
          Tray {
            bar: window
          }
        }
      }

      exclusiveZone: height
      exclusionMode: ExclusionMode.Ignore
      WlrLayershell.namespace: "shell:bar"
    }
  }
}
