import Quickshell
import QtQuick
import "hyprland" as Hyprland
import "tray" as Tray
import qs.config
import qs.common
import qs.components

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: window
    name: "bar"
    required property ShellScreen modelData
    screen: modelData

    implicitHeight: 40
    color: Colours.colourscheme.background

    anchors {
      left: true
      right: true
      top: true
    }

    ModuleGroup {
      id: leftContent
      anchors.left: parent.left
      anchors.leftMargin: 7.5

      OsIcon {}
      Hyprland.WorkspaceWidget {}
      Hyprland.ActiveClientWidget {}
    }

    ModuleGroup {
      id: centerContent

      anchors.horizontalCenter: parent.horizontalCenter

      Clock {}
      Spotify {}
    }

    ModuleGroup {
      id: rightContent

      anchors.right: parent.right
      anchors.rightMargin: 7.5

      Tray.Widget {}
      Battery {}
      IdleInhibit {}
      Pipewire {}
      Network {}
      PowerMenu {}
    }

    exclusionMode: ExclusionMode.Ignore
    exclusiveZone: height
  }
}
