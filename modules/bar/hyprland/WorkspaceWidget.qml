import QtQuick
import Quickshell.Hyprland

import qs.modules.common

Item {
  visible: loader.active
  implicitWidth: loader.implicitWidth
  implicitHeight: Appearance.sizes.barHeight
  Loader {
    id: loader
    active: Hyprland.workspaces.values.length > 0
    anchors.centerIn: parent
    sourceComponent: Row {
      spacing: 5
      Repeater {
        model: Hyprland.workspaces
        Workspace {}
      }
    }
  }
}
