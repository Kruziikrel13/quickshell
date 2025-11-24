import Quickshell
import Quickshell.Hyprland
import qs

Scope {
  id: root

  GlobalShortcut {
    appid: "shell"
    name: "powermenu"
    description: "Desktop Power Menu"
    onPressed: () => {
      GlobalState.showPowerMenu = !GlobalState.showPowerMenu;
    }
  }

  LazyLoader {
    id: loader
    active: GlobalState.showPowerMenu
    Window {}
  }
}
