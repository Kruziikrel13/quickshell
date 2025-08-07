import QtQuick
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import qs.components

WrapperItem {
  id: root
  visible: Hyprland.activeToplevel != null
  anchors.verticalCenter: parent.verticalCenter
  property string window: ""

  Component.onCompleted: getClient.running = true
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
    function onRawEvent(ev) {
      switch (ev.name) {
      case "activewindowv2":
      case "openwindowv2":
      case "closewindow":
      case "focusedmonv2":
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
