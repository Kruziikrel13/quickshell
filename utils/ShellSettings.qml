pragma Singleton

import QtQuick
import QtCore
import Quickshell

import qs.services

/**
 * Global Settings Service
 */

Singleton {
  id: root

  property string settingsFile: Quickshell.shellPath("settings.ini")
  property string defaultAvatar: Quickshell.env("HOME") + "/.face"
  property bool isInitialLoad: true

  property alias general: general
  Settings {
    id: general
    location: Qt.resolvedUrl(root.settingsFile)
    property string avatarImage: root.defaultAvatar
  }

  readonly property var init: () => {}
}
