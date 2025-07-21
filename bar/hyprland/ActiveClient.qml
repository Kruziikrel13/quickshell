import QtQuick
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import qs.components

// FIX: Implement this in a similar format to Workspaces.qml
// NOTE: This implementation is not currently possible until Hyprland.activeTopLevel.lastIpcObject is able to be properly bound and updated live
WrapperItem {
  id: root
  property string window: ""
  visible: !!window
  anchors.verticalCenter: parent.verticalCenter

  Component.onCompleted: getClient.running = true

  // Runs once on startup
  Process {
    id: getClient
    command: ["bash", "-c", "hyprctl activewindow -j"]
    stdout: StdioCollector {
      onStreamFinished: {
        root.window = JSON.parse(this.text).initialTitle ?? "";
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
    id: text
    text: root.window
  }
}
