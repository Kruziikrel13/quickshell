import qs
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

Scope {
  IpcHandler {
    target: "powermenu"

    function open(): void {
      GlobalStates.powermenu("open");
    }

    function close(): void {
      GlobalStates.powermenu("close");
    }

    function toggle(): void {
      GlobalStates.powermenu("toggle");
    }
  }

  LazyLoader {
    id: loader
    activeAsync: GlobalStates.showPowerMenu
    Window {
      id: window
      HyprlandFocusGrab {
        active: true
        windows: [window]
        onCleared: GlobalStates.powermenu("close")
      }
    }
  }
}
