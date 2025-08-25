//@ pragma ShellId shell
//@ pragma UseQApplication

import QtQuick
import Quickshell
import qs.modules.background
import qs.modules.bar
import qs.modules.powermenu as PowerMenu

ShellRoot {
  Background {}
  Bar {}
  PowerMenu.Controller {}
}
