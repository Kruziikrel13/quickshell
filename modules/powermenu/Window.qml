//@ pragma Internal
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import "systemcontrol" as SystemControl
import "quickcontrols" as QuickControls
import qs.config
import qs.components
import qs.components

StyledWindow {
  id: window
  name: "powermenu"
  anchors {
    top: true
    right: true
  }
  margins.top: 10
  margins.right: 10

  implicitHeight: background.height + background.margin
  implicitWidth: background.width + background.margin
  mask: Region {
    item: background
  }

  RectangularShadow {
    anchors.fill: background
    radius: background.radius
    offset.x: 10
    offset.y: 10
    blur: 20
    color: Qt.darker(background.color, 1.6)
  }

  WrapperRectangle {
    id: background
    margin: 20
    radius: 20
    color: StyleConfig.colourscheme.background

    ColumnLayout {
      id: content
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: 10
      spacing: 10
      SystemControl.Widget {
        Layout.alignment: Qt.AlignTop
      }
      QuickControls.Widget {
        Layout.fillWidth: true
      }
    }
  }
}
