pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "hyprland" as Hyprland
import qs

PanelWindow {
  id: root
  WlrLayershell.namespace: "shell:bar"
  implicitHeight: ShellGlobals.sizes.barHeight
  exclusiveZone: height
  color: ShellGlobals.colors.background

  mask: Region {
    width: root.width
    height: root.exclusiveZone
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

    }
  }
}
