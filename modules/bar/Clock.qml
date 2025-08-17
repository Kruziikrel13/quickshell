//@ pragma Internal

import QtQuick
import Quickshell
import qs.components

BarWidget {
  SystemClock {
    id: time
    precision: SystemClock.Seconds
  }

  StyledText {
    bold: true
    text: Qt.formatDateTime(time.date, "hh:mm - dddd dd.")
  }
}
