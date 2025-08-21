//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar"
import "modules/background"
import "modules/powermenu" as PowerMenu

ShellRoot {
  Background {}
  Bar {}
  PowerMenu.Controller {}
}
