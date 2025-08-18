pragma Singleton
import QtQuick
import Quickshell
import qs.config

Singleton {
  id: root

  property color background: StyleConfig.colourscheme.background
  property color widgetBackground: Qt.lighter(root.background, 1.4)
  property string profileImage: Qt.resolvedUrl(Quickshell.shellPath("assets/face"))
  property var height: "auto"
  property var width: "auto"
}
