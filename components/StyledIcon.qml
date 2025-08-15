import QtQuick
import Quickshell.Widgets
import qs.config

IconImage {
  property real size: StyleConfig.font.pixelSize.normal
  implicitSize: size
  asynchronous: true
}
