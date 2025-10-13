pragma Singleton

import QtQuick
import Quickshell

Singleton {
  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  property string time: Qt.formatDateTime(clock.date, "hh:mm")
  property string shortDate: Qt.formatDateTime(clock.date, "dd/MM")
  property string date: Qt.formatDateTime(clock.date, "dd MMMM yyyy")
}
