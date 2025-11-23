import QtQuick
import Quickshell
import Quickshell.Widgets

import qs.modules.common

IconImage {
  required property string icon
  property real size: Appearance.font.pixelSize.normal
  implicitSize: size
  asynchronous: true
  source: Qt.resolvedUrl(Quickshell.shellPath("assets/icons")) + "/" + icon
}
