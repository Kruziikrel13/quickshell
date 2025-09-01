import QtQuick
import Quickshell.Io
import Quickshell.Hyprland
import qs.components
import ".."

BarWidget {
  id: root
  visible: window !== ""
  property string window: ""

  Component.onCompleted: getClient.running = true
  Process {
    id: getClient
    command: ["sh", "-c", "hyprctl activewindow -j"]
    stdout: StdioCollector {
      onStreamFinished: {
        root.window = JSON.parse(this.text).initialTitle ?? "";
      }
    }
  }

  Connections {
    target: Hyprland
    function onRawEvent(ev) {
      switch (ev.name) {
      case "activewindowv2":
      case "openwindowv2":
      case "closewindow":
        getClient.running = true;
        break;
      }
    }
  }

  StyledText {
    id: text
    bold: true
    text: root.window
  }
}
