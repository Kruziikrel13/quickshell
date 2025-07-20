import QtQuick
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import qs.components

WrapperItem {
  id: root
  property string window: ""
  anchors.verticalCenter: parent.verticalCenter
  visible: !!window

  Component.onCompleted: getClient.running = true

  // Runs once on startup
  Process {
    id: getClient
    command: ["bash", "-c", "hyprctl activewindow -j"]
    stdout: StdioCollector {
      onStreamFinished: {
        root.window = JSON.parse(this.text).initialTitle ?? ""
      }
    }
  }

  Connections {
    target: Hyprland
    function onRawEvent(event) {
      switch (event.name) {
        case "activewindowv2":
        case "openwindowv2":
        case "closewindow":
        getClient.running = true;
        break;
      }
    }
  }

  StyledText {
    text: root.window
  }
}
