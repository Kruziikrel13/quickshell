pragma Singleton

import QtQuick
import QtCore
import Quickshell


/**
 * Global Settings Service
 */

Singleton {
  id: root

  property string settingsFile: Quickshell.shellPath("settings.ini")
  property string defaultDirectory: Quickshell.shellPath("assets/wallpapers")
  property string defaultWallpaper: Quickshell.shellPath("assets/wallpapers/sunnymountains.jpg")
  property string defaultAvatar: Quickshell.env("HOME") + "/.face"
  property bool isInitialLoad: true

  property alias general: general
  Settings {
    id: general
    location: Qt.resolvedUrl(root.settingsFile)
    property string avatarImage: root.defaultAvatar
  }

  property alias wallpaper: wallpaper
  Settings {
    id: wallpaper
    location: Qt.resolvedUrl(root.settingsFile)
    category: "Wallpaper"
    property string current: root.defaultWallpaper
    property string directory: root.defaultDirectory
    property bool isRandom: false
    property int randomInterval: 300

  }

  readonly property var init: () => {}
}
