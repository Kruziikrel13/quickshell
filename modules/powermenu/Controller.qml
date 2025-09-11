import Quickshell
import Quickshell.Hyprland
import qs.utils

Scope {
  id: root

  GlobalShortcut {
    appid: "shell"
    name: "powermenu"
    description: "Desktop Power Menu"
    onPressed: () => {
      ShellStates.powermenu = !ShellStates.powermenu;
    }
  }

  LazyLoader {
    id: loader
    activeAsync: ShellStates.powermenu
    Window {}
  }
}
