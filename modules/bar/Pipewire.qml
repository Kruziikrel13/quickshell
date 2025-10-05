//@ pragma Internal

import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.config
import qs.components
import qs.services

BarWidget {
  id: root
  property bool initialised: false

  function getIcon() {
    if (AudioService.muted) {
      return " ";
    }
    return (AudioService.volume <= Number.EPSILON) ? " " : (AudioService.volume <= 0.5) ? " " : " ";
  }

  MouseArea {
    id: mArea
    implicitWidth: icon.width
    implicitHeight: icon.height
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true
    property int acc: 0
    onWheel: wheel => {
      acc += wheel.angleDelta.y;

      if (acc >= 120) {
        acc = 0;
        AudioService.increaseVolume();
      } else if (acc <= -120) {
        acc = 0;
        AudioService.decreaseVolume();
      }
    }
    onClicked: event => {
      event.accepted = true;
      switch (event.button) {
      case Qt.LeftButton:
        AudioService.setOutputMuted(!AudioService.muted);
        break;
      case Qt.RightButton:
        Quickshell.execDetached(["ghostty", "--class=ghostty.tui", "-e", "pulsemixer"]);
        break;
      }
    }

    StyledText {
      id: icon
      text: root.getIcon()
      color: mArea.containsMouse ? StyleConfig.colourscheme.blue : defaultColor
    }
  }
}
