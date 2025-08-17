import Quickshell
import QtQuick
import QtQuick.Layouts
import "hyprland" as Hyprland
import "tray"
import qs.config
import qs.components

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: window
    name: "bar"
    required property ShellScreen modelData
    screen: modelData

    implicitHeight: BarConfig.height
    color: BarConfig.background

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
        // Spotify {}
      }
      ModuleGroup {
        layoutDirection: Qt.RightToLeft
        Network {}
        Pipewire {}
        Tray {}
      }
    }

    exclusionMode: ExclusionMode.Ignore
    exclusiveZone: height
  }
}
