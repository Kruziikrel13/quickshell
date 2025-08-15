//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar"
import "modules/background"

ShellRoot {
  Background {}
  Bar.Window {}
}
