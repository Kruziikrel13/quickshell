//@ pragma Internal
import QtQuick
import Quickshell

import qs.services
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: text.implicitWidth
  implicitHeight: Appearance.sizes.barHeight
  StyledText {
    id: text
    anchors.centerIn: parent
    color: mouseArea.containsMouse ? Appearance.colours.primary : Appearance.colours.on_background
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

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    onClicked: Quickshell.execDetached(["ghostty", "--class=ghostty.tui", "-e", "nmtui"])
  }
}
