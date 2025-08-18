//@ pragma Internal
import QtQuick
import Quickshell.Widgets

ClippingWrapperRectangle {
  property alias icon: img.source
  radius: 10
  Image {
    id: img
    sourceSize: Qt.size(64, 64)
  }
}
