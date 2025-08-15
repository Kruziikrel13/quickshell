pragma Singleton
import QtQuick
import Quickshell

Singleton {
  id: root

  property QtObject wallpapers

  property string wallpaper: StyleConfig.colours.darkmode ? wallpapers.darkWallpaper : wallpapers.lightWallpaper
  wallpapers: QtObject {
    property string darkWallpaper: "icelandbeach2.jpg"
    property string lightWallpaper: ""
  }
}
