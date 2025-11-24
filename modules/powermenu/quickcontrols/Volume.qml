//@ pragma Internal
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.services
import qs.modules.common
import qs.modules.common.widgets

RowLayout {
  StyledText {
    Layout.preferredWidth: font.pixelSize
    function getIcon() {
      if (AudioService.muted) {
        return " ";
      }
      return (AudioService.volume <= Number.EPSILON) ? " " : (AudioService.volume <= 0.5) ? " " : " ";
    }
    text: getIcon()
  }
  WrapperMouseArea {
    cursorShape: Qt.PointingHandCursor
    Layout.fillWidth: true
    property int acc: 0
    onWheel: event => {
      acc += event.angleDelta.y;

      if (acc >= 120) {
        acc = 0;
        AudioService.increaseVolume();
      } else if (acc >= -120) {
        acc = 0;
        AudioService.decreaseVolume();
      }
    }
    drag.target: slider
    drag.axis: Drag.XAxis
    drag.minimumX: 0
    drag.maximumX: width
    onPressed: mouse => {
      const vol = (mouse.x / width).toFixed(2);
      AudioService.setVolume(vol);
    }
    onPositionChanged: mouse => {
      if (!drag.active) {
        return;
      }
      const vol = (mouse.x / width).toFixed(2);
      AudioService.setVolume(vol);
    }
    Rectangle {
      radius: 10
      implicitHeight: 20
      color: Qt.darker(Appearance.colours.background, 1.4)
      Rectangle {
        id: slider
        anchors {
          left: parent.left
          top: parent.top
          bottom: parent.bottom
        }
        implicitWidth: parent.width * (AudioService.sink?.audio.volume ?? 0)
        bottomLeftRadius: parent.radius
        topLeftRadius: parent.radius
        topRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        bottomRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        color: Appearance.colours.primary
      }
    }
  }
}
