//@ pragma Internal
import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import "systemcontrol" as SystemControl
import "quickcontrols" as QuickControls
import qs.config
import qs.components
import qs.components

StyledWindow {
  id: window
  name: "powermenu"
  WlrLayershell.layer: WlrLayer.Overlay
  anchors {
    top: true
    right: true
  }
  margins.top: 10
  margins.right: 10

  implicitHeight: 180
  implicitWidth: 500
  mask: Region {
    item: background
  }

  RectangularShadow {
    anchors.fill: background
    scale: background.scale
    radius: background.radius
    offset.x: 10
    offset.y: 10
    blur: 10
    color: Qt.darker(background.color, 1.6)
  }

  Rectangle {
    id: background
    anchors.fill: parent
    anchors.topMargin: 20
    anchors.bottomMargin: 20
    anchors.rightMargin: 20
    anchors.leftMargin: 20
    radius: 20
    color: StyleConfig.colourscheme.background
    Column {
      anchors.fill: parent
      anchors.topMargin: 10
      anchors.rightMargin: 10
      anchors.leftMargin: 10
      anchors.bottomMargin: 10
      SystemControl.Widget {}
      QuickControls.Widget {}
    }
  }
}
