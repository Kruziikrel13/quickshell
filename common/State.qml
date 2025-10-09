pragma Singleton

import QtQuick
import Quickshell

Singleton {
  property bool isInitialLoad: true
  property bool showLauncher: false
  property bool showPowerMenu: false

  function reset(): void {
    showLauncher = false;
    showPowerMenu = false;
  }
}
