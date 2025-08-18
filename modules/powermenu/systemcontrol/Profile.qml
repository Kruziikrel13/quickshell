//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets

ClippingWrapperRectangle {
  radius: 10
  Image {
    id: img
    sourceSize: Qt.size(64, 64)
    source: Qt.resolvedUrl(Quickshell.shellPath("assets/face"))
  }
}
