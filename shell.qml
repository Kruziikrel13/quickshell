//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar" as Bar
import "modules/background"

ShellRoot {
  Background {}
  Bar.Window {}
}
