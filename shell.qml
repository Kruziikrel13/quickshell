//@ pragma ShellId shell

import Quickshell
import "bar" as Bar

ShellRoot {
  Variants {
    model: Quickshell.screens

    Scope {
      required property ShellScreen modelData

      Bar.Window {
        screen: modelData
      }
    }
  }
}
