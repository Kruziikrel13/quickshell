import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Hyprland

WrapperItem {
  visible: Hyprland.workspaces.values.length > 0
  anchors.verticalCenter: parent.verticalCenter

  RowLayout {
    spacing: 5
    Repeater {
      model: Hyprland.workspaces
      Workspace {}
    }
  }
}
