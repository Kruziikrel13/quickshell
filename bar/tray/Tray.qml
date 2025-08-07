pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

WrapperItem {
  id: root
  visible: SystemTray.items.values.length > 0
  required property PanelWindow bar
  anchors.verticalCenter: parent.verticalCenter

  RowLayout {
    spacing: 5
    Repeater {
      model: SystemTray.items
      TrayItem {
        bar: root.bar
      }
    }
  }
}
