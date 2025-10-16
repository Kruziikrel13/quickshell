pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property string face: Qt.resolvedUrl(Quickshell.env("HOME") + "/.face")
  readonly property int lockTimeout: 300
  readonly property int suspendTimeout: 900
}
