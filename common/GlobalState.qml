pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  property alias isInitialLoad: persist.isInitialLoad
  property alias screenLocked: persist.screenLocked
  property bool showLauncher: false
  property bool showPowerMenu: false

  property string hyprlandInstance: Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE") || ""

  PersistentProperties {
    id: persist
    reloadableId: "commonStates"
    property bool isInitialLoad: true
    property bool screenLocked: false

    onLoaded: {
      // Lock screen on first load
      if (isInitialLoad) {
        screenLocked = true;
        isInitialLoad = false;
      }
    }
  }

  function lockScreen() {
    root.showLauncher = false;
    root.showPowerMenu = false;
    root.screenLocked = true;
  }

  function reset(): void {
    showLauncher = false;
    showPowerMenu = false;
  }

  IpcHandler {
    target: "state"

    function printState(): string {
      var stateString = "State:\n" + "  isInitialLoad: " + root.isInitialLoad + "\n" + "  showLauncher: " + root.showLauncher + "\n" + "  showPowerMenu: " + root.showPowerMenu + "\n" + "  screenLocked: " + root.screenLocked;
      return stateString;
    }
  }
}
