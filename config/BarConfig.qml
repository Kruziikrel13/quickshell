pragma Singleton
import QtQuick
import Quickshell

Singleton {
  id: root

  property color background: StyleConfig.colourscheme.background
  property color widgetBackground: StyleConfig.colourscheme.brightBlack
  property real height: StyleConfig.sizes.barHeight
  property bool showWidgetBackground: true
}
