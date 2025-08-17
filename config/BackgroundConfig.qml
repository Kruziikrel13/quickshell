pragma Singleton
import QtQuick
import Quickshell

import qs.config

Singleton {
  id: root
  property var wallpapers

  property string wallpaper: StyleConfig.colours.darkmode ? wallpapers.darkWallpaper : wallpapers.lightWallpaper
  wallpapers: QtObject {
    property string darkWallpaper: "icelandbeach2.jpg"
    property string lightWallpaper: ""
  }
}
