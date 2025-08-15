//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "modules/bar" as Bar
import "background"

ShellRoot {
  Background {}
  Bar.Window {}
}
