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
      if (!Network.wifi) return "";

      const strength = Network.strength
      if (strength < 0.2) return "󰤯";
      if (strength < 0.4) return "󰤟";
      if (strength < 0.6) return "󰤢";
      if (strength < 0.8) return "󰤥";
      if (strength <= 1.0) return "󰤨"
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    onClicked: Quickshell.execDetached(["ghostty", "--class=ghostty.tui", "-e", "nmtui"])
  }
}
