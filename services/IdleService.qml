pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.common

Singleton {
  id: root

  property alias inhibit: persist.inhibit

  PersistentProperties {
    id: persist
    reloadableId: "idleServiceInhibitState"
    property bool inhibit: false
  }

  function toggleInhibit() {
    root.inhibit = !root.inhibit;
  }

  IdleInhibitor {
    id: idleInhibitor
    enabled: root.inhibit
    // fake window to inhibit on
    window: PanelWindow {
      implicitWidth: 0
      implicitHeight: 0
      color: "transparent"
      anchors {
        right: true
        bottom: true
      }
      mask: Region {
        item: null
      }
    }
  }

  IdleMonitor {
    id: lockMonitor
    enabled: !GlobalState.screenLocked
    timeout: Settings.lockTimeout
    respectInhibitors: true

    onIsIdleChanged: {
      if (this.isIdle)
        GlobalState.lockScreen();
    }
  }

  IdleMonitor {
    id: suspendMonitor
    enabled: GlobalState.screenLocked
    timeout: Settings.suspendTimeout
    onIsIdleChanged: {
      if (this.isIdle)
        Quickshell.execDetached(["systemctl", "suspend"]);
    }
  }

  function start(): void {
  }
}
