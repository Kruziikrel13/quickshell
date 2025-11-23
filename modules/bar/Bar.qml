import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.modules.common
import qs.modules.common.widgets

Variants {
  model: Quickshell.screens

  StyledWindow {
    id: window
    name: "bar"

    required property ShellScreen modelData
    screen: modelData

    implicitHeight: Appearance.sizes.barSize
    color: Appearance.colours.background

    anchors {
      left: true
      right: true
      top: true
    }

    ModuleGroup {
      id: leftContent
      anchors.left: parent.left
      anchors.leftMargin: 7.5
    }

    ModuleGroup {
      id: centerContent
      anchors.horizontalCenter: parent.horizontalCenter

      Clock {}
    }

    ModuleGroup {
      id: rightContent
      anchors.right: parent.right
      anchors.rightMargin: 7.5
    }

    exclusionMode: ExclusionMode.Ignore
    exclusiveZone: height
  }
}
