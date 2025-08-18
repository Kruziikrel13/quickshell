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
      const volume = Audio.sink?.audio.volume;
      if (Audio.sink?.audio.muted || volume <= 0) {
        return "";
      }
      if (volume > 0 && volume <= 0.2) {
        return "";
      } else if (volume > 0.2 && volume <= 0.45) {
        return "";
      } else if (volume > 0.45) {
        return "";
      }
      // Failed to get audio info, show error
      return "";
    }
  }
  WrapperMouseArea {
    cursorShape: Qt.PointingHandCursor
    Layout.fillWidth: true
    onWheel: event => {
      if (event.angleDelta.y > 0 && Audio.sink?.audio.volume < 1) {
        Audio.sink.audio.volume += 0.05;
      } else if (event.angleDelta.y < 0 && Audio.sink?.audio.volume > 0) {
        Audio.sink.audio.volume -= 0.05;
      }
    }
    drag.target: slider
    drag.axis: Drag.XAxis
    drag.minimumX: 0
    drag.maximumX: width
    onPressed: mouse => {
      const vol = (mouse.x / width).toFixed(2);
      if (vol <= 1) {
        Audio.sink.audio.volume = (mouse.x / width).toFixed(2);
      }
    }
    onPositionChanged: mouse => {
      if (!drag.active) {
        return;
      }
      const vol = (mouse.x / width).toFixed(2);
      if (vol <= 1) {
        Audio.sink.audio.volume = (mouse.x / width).toFixed(2);
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
        implicitWidth: parent.width * (Audio.sink?.audio.volume ?? 0)
        bottomLeftRadius: parent.radius
        topLeftRadius: parent.radius
        topRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        bottomRightRadius: implicitWidth >= parent.width ? parent.radius : 0
        color: StyleConfig.colourscheme.blue
      }
    }
  }
}
