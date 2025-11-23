//@ pragma Internal
import QtQuick

import qs.common
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: text.implicitWidth
  implicitHeight: Appearance.sizes.barHeight

  StyledText {
    id: text
    anchors.centerIn: parent
    color: mouseArea.containsMouse ? Appearance.colours.primary : Appearance.colours.error
    text: ""
  }

  MouseArea {
    id: mouseArea
    hoverEnabled: true
    anchors.fill: parent
    onClicked: GlobalState.showPowerMenu = !GlobalState.showPowerMenu
  }
}
