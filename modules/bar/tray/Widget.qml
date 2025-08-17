import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import qs.config
import ".."

BarWidget {
  visible: loader.active
  Loader {
    id: loader
    active: SystemTray.items.values.length > 0
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
        visible: !BarConfig.showWidgetBackground
        implicitWidth: 6
        implicitHeight: implicitWidth
        radius: height / 2
        color: StyleConfig.colourscheme.foreground
      }
    }
  }
}
