//@ pragma Internal
import Quickshell
import Quickshell.Widgets
import qs.components

WrapperItem {
  anchors.verticalCenter: parent.verticalCenter

  SystemClock {
    id: time
    precision: SystemClock.Seconds
  }

  StyledText {
    text: Qt.formatDateTime(time.date, "hh:mm - dddd dd.")
  }
}
