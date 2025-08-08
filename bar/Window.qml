import Quickshell
import QtQuick
import QtQuick.Layouts
import "hyprland" as Hyprland
import "tray"
import qs
import qs.components

Scope {
  Variants {
    model: Quickshell.screens

    StyledWindow {
      id: window
      name: "bar"
      required property ShellScreen modelData
      screen: modelData

      implicitHeight: ShellGlobals.sizes.barHeight
      color: ShellGlobals.colors.background

      mask: Region {
        item: content
      }

      anchors {
        left: true
        right: true
        top: true
      }

      RowLayout {
        id: content
        anchors.fill: parent
        spacing: 0

        ModuleGroup {
          OsIcon {}
          Hyprland.Workspaces {}
          Hyprland.ActiveClient {}
        }
        ModuleGroup {
          center: true
          Clock {}
          Spotify {}
        }
        ModuleGroup {
          layoutDirection: Qt.RightToLeft
          Pipewire {}
          Tray {}
        }
      }

      exclusionMode: ExclusionMode.Ignore
      exclusiveZone: height
    }
  }
}
