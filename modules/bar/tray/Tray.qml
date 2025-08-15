pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs

WrapperItem {
  id: root
  visible: SystemTray.items.values.length > 0
  anchors.verticalCenter: parent.verticalCenter

  RowLayout {
    spacing: 5
    Repeater {
      model: SystemTray.items
      TrayItem {
        required property SystemTrayItem modelData
        item: modelData
      }
    }

    Rectangle {
      visible: SystemTray.items.values.length > 0
      implicitWidth: ShellGlobals.sizes.icons.smallest
      implicitHeight: implicitWidth
      color: ShellGlobals.colors.onbackground
    }
  }
}
