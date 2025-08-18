pragma Singleton
import QtQuick
import Quickshell
import qs.config

Singleton {
  id: root
  property color background: StyleConfig.colourscheme.background
  property color widgetBackground: Qt.lighter(root.background, 1.4)
  property real height: StyleConfig.sizes.barHeight
  property bool showWidgetBackground: true
}
