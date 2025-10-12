import QtQuick
import qs.services

Image {
  id: root
  readonly property string wallpaperSource: WallpaperService.getWallpaperPath() !== "" ? WallpaperService.getWallpaperPath() : ""
  anchors.fill: parent
  source: root.wallpaperSource
  visible: root.wallpaperSource !== ""
  fillMode: Image.PreserveAspectCrop
  cache: true
  smooth: true
  mipmap: false
}
