//@ pragma Internal

import Quickshell
import Quickshell.Widgets
import QtQuick

import qs.services
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: icon.implicitWidth
  implicitHeight: Appearance.sizes.barHeight
  property bool initialised: false

  function getIcon() {
    if (AudioService.muted) {
      return " ";
    }
    return (AudioService.volume <= Number.EPSILON) ? " " : (AudioService.volume <= 0.5) ? " " : " ";
  }

  StyledText {
    id: icon
    anchors.centerIn: parent
    text: root.getIcon()
    color: mArea.containsMouse ? Appearance.colours.primary : Appearance.colours.on_background
  }

  MouseArea {
    id: mArea
    anchors.fill: parent
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
  }
}
