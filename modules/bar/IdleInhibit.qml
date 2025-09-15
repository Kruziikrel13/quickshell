//@ pragma Internal

import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import qs.config
import qs.components

BarWidget {
  id: root
  PersistentProperties {
    id: persist
    reloadableId: "IdleInhibitStates"
    property bool inhibited: false
  }
  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton
    hoverEnabled: true
    onClicked: event => {
      event.accepted = true;
      persist.inhibited = !persist.inhibited;
    }
    IdleInhibitor {
      window: root.QsWindow.window
      enabled: persist.inhibited
    }
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.blue : defaultColor
      text: persist.inhibited ? "" : ""
    }
  }
}
