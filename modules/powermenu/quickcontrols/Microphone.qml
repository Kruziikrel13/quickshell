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
      const volume = Audio.source?.audio.volume;
      if (Audio.source?.audio.muted || volume <= 0) {
        return "";
      }
      return "";
    }
  }
  WrapperMouseArea {
    cursorShape: Qt.PointingHandCursor
    Layout.fillWidth: true
    onWheel: event => {
      if (event.angleDelta.y > 0 && Audio.source?.audio.volume < 1) {
        Audio.source.audio.volume += 0.05;
      } else if (event.angleDelta.y < 0 && Audio.source?.audio.volume > 0) {
        Audio.source.audio.volume -= 0.05;
      }
    }
    drag.target: slider
    drag.axis: Drag.XAxis
    drag.minimumX: 0
    drag.maximumX: width
    onPressed: mouse => {
      const vol = (mouse.x / width).toFixed(2);
      if (vol <= 1) {
        Audio.source.audio.volume = (mouse.x / width).toFixed(2);
      }
    }
    onPositionChanged: mouse => {
      if (!drag.active) {
        return;
      }
      const vol = (mouse.x / width).toFixed(2);
      if (vol <= 1) {
        Audio.source.audio.volume = (mouse.x / width).toFixed(2);
      }
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
        implicitWidth: parent.width * (Audio.source?.audio.volume ?? 0)
        bottomLeftRadius: parent.radius
        topLeftRadius: parent.radius
        topRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        bottomRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        color: StyleConfig.colourscheme.blue
      }
    }
  }
}
