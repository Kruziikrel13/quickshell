import QtQuick
import Quickshell.Hyprland
import ".."

BarWidget {
  visible: loader.active
  Loader {
    id: loader
    active: Hyprland.workspaces.values.length > 0
    sourceComponent: Row {
      spacing: 5
      Repeater {
        model: Hyprland.workspaces
        Workspace {}
      }
    }
  }
}
