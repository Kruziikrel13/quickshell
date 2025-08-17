import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import ".."

BarWidget {
  visible: loader.active
  Loader {
    id: loader
    active: Hyprland.workspaces.values.length > 0
    sourceComponent: RowLayout {
      spacing: 5
      Repeater {
        model: Hyprland.workspaces
        Workspace {}
      }
    }
  }
}
