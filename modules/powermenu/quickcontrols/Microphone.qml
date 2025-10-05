//@ pragma Internal
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.services
import qs.config
import qs.components

RowLayout {
  StyledText {
    Layout.preferredWidth: font.pixelSize
    text: {
      const volume = AudioService.source?.audio.volume;
      if (AudioService.inputMuted) {
        return "";
      }
      return "";
    }
  }
  WrapperMouseArea {
    cursorShape: Qt.PointingHandCursor
    Layout.fillWidth: true
    property int acc: 0
    onWheel: event => {
      acc += event.angleDelta.y;

      if (acc >= 120) {
        acc = 0;
        AudioService.increaseInputVolume();
      } else if (acc >= -120) {
        acc = 0;
        AudioService.decreaseInputVolume();
      }
    }
    drag.target: slider
    drag.axis: Drag.XAxis
    drag.minimumX: 0
    drag.maximumX: width
    onPressed: mouse => {
      const vol = (mouse.x / width).toFixed(2);
      AudioService.setInputVolume(vol);
    }
    onPositionChanged: mouse => {
      if (!drag.active) {
        return;
      }
      const vol = (mouse.x / width).toFixed(2);
      AudioService.setInputVolume(vol);
    }
    Rectangle {
      radius: 10
      implicitHeight: 20
      color: Qt.darker(StyleConfig.colourscheme.background, 1.4)
      Rectangle {
        id: slider
        anchors {
          left: parent.left
          top: parent.top
          bottom: parent.bottom
        }
        implicitWidth: parent.width * (AudioService.source?.audio?.volume ?? 0)
        bottomLeftRadius: parent.radius
        topLeftRadius: parent.radius
        topRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        bottomRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        color: StyleConfig.colourscheme.blue
      }
    }
  }
}
