//@ pragma ShellId shell
//@ pragma UseQApplication
//@ pragma RespectSystemStyle

import QtQuick
import Quickshell
import qs.utils
import qs.modules.background
import qs.modules.bar
import qs.modules.lockscreen
import qs.modules.powermenu as PowerMenu

ShellRoot {
  Background {}
  Bar {}
  PowerMenu.Controller {}
  Component.onCompleted: [ShellSettings.init()]
  LockScreen {}
}
