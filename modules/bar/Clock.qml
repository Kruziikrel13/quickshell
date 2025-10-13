//@ pragma Internal

import QtQuick
import qs.components
import qs.services

BarWidget {
  StyledText {
    bold: true
    text: TimeService.time + " - " + TimeService.date
  }
}
