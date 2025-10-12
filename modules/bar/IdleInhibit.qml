//@ pragma Internal

import QtQuick
import Quickshell.Widgets
import qs.config
import qs.services
import qs.components

BarWidget {
  id: root
  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton
    hoverEnabled: true
    onClicked: event => {
      event.accepted = true;
      IdleService.toggleInhibit();
    }

    StyledText {
      color: IdleService.inhibit ? StyleConfig.colourscheme.accent : defaultColor
      text: ""
    }
  }
}
