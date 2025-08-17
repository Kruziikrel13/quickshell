pragma Singleton
import QtQuick
import Quickshell
import qs.config

Singleton {
  property color background: StyleConfig.colourscheme.background
  property color widgetBackground: StyleConfig.colourscheme.brightBlack
  property real height: StyleConfig.sizes.barHeight
  property bool showWidgetBackground: false
}
