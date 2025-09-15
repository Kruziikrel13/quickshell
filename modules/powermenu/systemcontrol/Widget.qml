import QtQuick
import QtQuick.Layouts
import qs.utils
import qs.config

GridLayout {
  anchors.left: parent.left
  anchors.right: parent.right
  Layout.maximumHeight: icon.height
  Profile {
    id: icon
    icon: ShellSettings.general.avatarImage
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
        color: StyleConfig.colourscheme.red
      }
    ]
    SysButton {
      required property int index
      required property var modelData
      Layout.column: 3 + index
      Layout.row: 2
      text: modelData.text
      command: modelData.command
      color: modelData?.color ?? StyleConfig.colourscheme.white
    }
  }
}
