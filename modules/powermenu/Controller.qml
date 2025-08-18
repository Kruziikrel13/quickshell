pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

Scope {
  PersistentProperties {
    id: persist
    property bool show: false
  }
  IpcHandler {
    target: "powermenu"

    function open(): void {
      persist.show = true;
    }

    function close(): void {
      persist.show = false;
    }

    function toggle(): void {
      persist.show = !persist.show;
    }
  }

  LazyLoader {
    id: loader
    active: persist.show
    Window {
      id: window
      HyprlandFocusGrab {
        active: true
        windows: [window]
        onCleared: persist.show = false
      }
    }
  }
}
