//@ pragma ShellId shell
//@ pragma UseQApplication

import Quickshell
import "bar" as Bar
import "background" as Background

ShellRoot {
  Background.Window {}
  Bar.Window {}
}
