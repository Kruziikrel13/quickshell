import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

import qs.modules.common

Item {
  visible: loader.active
  implicitWidth: loader.implicitWidth
  implicitHeight: Appearance.sizes.barHeight
  Loader {
    id: loader
    active: SystemTray.items.values.length > 0
    anchors.centerIn: parent
    sourceComponent: RowLayout {
      spacing: 5
      Repeater {
        model: SystemTray.items
        TrayItem {
          required property SystemTrayItem modelData
          item: modelData
        }
      }
      Rectangle {
        implicitWidth: 6
        implicitHeight: implicitWidth
        radius: height / 2
        color: Appearance.colours.on_background
      }
    }
  }
}
