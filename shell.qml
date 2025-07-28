//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "bar" as Bar
import "background"

ShellRoot {
  Background {}
  Bar.Window {}
}
