//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar"
import "modules/background"
import "modules/powermenu" as PowerMenu

ShellRoot {
  id: root
  property bool enableBar: true
  property bool enableBackground: true
  property bool enablePowerMenu: true

  // Not Implemented
  property bool enableLock: true
  property bool enableNotifications: false
  property bool enableDashboard: false

  LazyLoader {
    active: root.enableBackground
    component: Background {}
  }

  LazyLoader {
    active: root.enableBar
    component: Bar {}
  }

  LazyLoader {
    active: root.enablePowerMenu
    component: PowerMenu.Controller {}
  }
}
