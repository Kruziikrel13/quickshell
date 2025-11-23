//@ pragma Internal
import QtQuick

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
    bold: true
    text: TimeService.time + " - " + TimeService.date
  }
}
