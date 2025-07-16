pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Hyprland
import qs.components

WrapperItem {
  property string window: ""
  anchors.verticalCenter: parent.verticalCenter
  visible: !!window

  // Runs once on startup
  Process {
    running: true
    command: ["bash", "-c", "hyprctl activewindow -j"]
    stdout: StdioCollector {
      onStreamFinished: {
        window = JSON.parse(text).initialTitle
      }
    }
  }


  Connections {
    target: Hyprland
    function onRawEvent(event) {
      switch (event.name) {
        case "activewindowv2":
        case "closewindow":
        case "openwindowv2":
        Hyprland.refreshToplevels()
        window = Hyprland.activeToplevel?.lastIpcObject.initialTitle
        break;
      }
    }
  }

  StyledText {
    text: window
  }
}
