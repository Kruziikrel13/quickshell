import QtQuick
import QtQuick.Layouts

import qs.modules.common

GridLayout {
  anchors.left: parent.left
  anchors.right: parent.right
  Layout.maximumHeight: icon.height
  Profile {
    id: icon
    icon: Config.face
    Layout.column: 1
    Layout.row: 1
    Layout.rowSpan: 3
  }
  Column {
    Layout.column: 2
    Layout.row: 2
    Layout.rowSpan: 2
    Layout.rightMargin: 25
    User {}
    Uptime {}
  }
  Repeater {
    model: [
      {
        text: "",
        command: "loginctl lock-session"
      },
      {
        text: "",
        command: "systemctl suspend"
      },
      {
        text: "",
        command: "systemctl reboot"
      },
      {
        text: "",
        command: "systemctl poweroff",
        color: Appearance.colours.error
      }
    ]
    SysButton {
      required property int index
      required property var modelData
      Layout.column: 3 + index
      Layout.row: 2
      text: modelData.text
      command: modelData.command
      color: modelData?.color ?? Appearance.colours.on_background
    }
  }
}
