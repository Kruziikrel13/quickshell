pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs.config

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
      implicitWidth: StyleConfig.font.pixelSize.smallest
      implicitHeight: implicitWidth
      color: StyleConfig.colourscheme.black
    }
  }
}
