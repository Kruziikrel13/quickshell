import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.services
import qs.components

LazyLoader {
  active: WallpaperService.currentWallpaper !== ""
  Variants {
    model: Quickshell.screens

    StyledWindow {
      id: background
      name: "background"
      screen: modelData
      visible: wallpaperSource !== ""
      required property ShellScreen modelData
      property string wallpaperSource: WallpaperService.currentWallpaper !== "" ? WallpaperService.currentWallpaper : ""

      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.exclusionMode: ExclusionMode.Ignore

      anchors {
        top: true
        bottom: true
        left: true
        right: true
      }

      Image {
        anchors.fill: parent
        source: background.wallpaperSource
        visible: background.wallpaperSource !== ""
        fillMode: Image.PreserveAspectCrop
        cache: true
        smooth: true
        mipmap: false
      }
    }
  }
}
