import Quickshell
import Quickshell.Hyprland
import qs.common

Scope {
  id: root

  GlobalShortcut {
    appid: "shell"
    name: "powermenu"
    description: "Desktop Power Menu"
    onPressed: () => {
      State.showPowerMenu = !State.showPowerMenu;
    }
  }

  LazyLoader {
    id: loader
    active: State.showPowerMenu
    Window {}
  }
}
