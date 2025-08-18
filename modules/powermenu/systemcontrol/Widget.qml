import QtQuick
import QtQuick.Layouts
import qs.config

GridLayout {
  Layout.maximumHeight: icon.height
  Profile {
    id: icon
    icon: PowerMenuConfig.profileImage
    Layout.column: 1
    Layout.row: 1
    Layout.rowSpan: 3
  }
  Column {
    Layout.column: 2
    Layout.row: 2
    User {}
    Uptime {}
    Layout.rightMargin: 25
  }
  LockButton {
    Layout.column: 3
    Layout.row: 2
  }
  SuspendButton {
    Layout.column: 4
    Layout.row: 2
  }
  RebootButton {
    Layout.column: 5
    Layout.row: 2
  }
  PowerButton {
    Layout.column: 6
    Layout.row: 2
  }
}
