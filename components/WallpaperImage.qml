import QtQuick
import qs.services

Image {
  id: root
  anchors.fill: parent
  source: root.wallpaperSource
  visible: root.wallpaperSource !== ""
  fillMode: Image.PreserveAspectCrop
  cache: true
  smooth: true
  mipmap: false
}
