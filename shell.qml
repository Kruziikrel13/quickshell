//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar"
import "modules/background"

ShellRoot {
  id: root
  property bool enableBar: true
  property bool enableBackground: true

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
}
