//@ pragma Internal

import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.components

WrapperItem {
  anchors.verticalCenter: parent.verticalCenter
  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true
    onClicked: event => {
      switch (event.button) {
      case Qt.RightButton:
      case Qt.LeftButton:
        Quickshell.execDetached(["ghostty", "--class=ghostty.tui", "-e", "sleep 0.5; nmtui"]);
        break;
      }
      event.accepted = true;
    }
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.blue : defaultColor
      text: {
        if (Network.ethernet) {
          return "";
        } else if (Network.wifi) {
          return "";
        } else {
          return " ";
        }
      }
    }
  }
}
