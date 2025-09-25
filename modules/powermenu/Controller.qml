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
      GlobalStates.showPowerMenu = !GlobalStates.showPowerMenu;
    }
  }

  LazyLoader {
    id: loader
    active: GlobalStates.showPowerMenu
    Window {}
  }
}
