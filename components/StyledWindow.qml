import Quickshell
import Quickshell.Wayland

PanelWindow {
  required property string name

  WlrLayershell.namespace: "shell:" + name
  color: "transparent"
}
