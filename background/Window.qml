import qs
import QtQuick
import Quickshell
import Quickshell.Wayland

Variants {
  model: Quickshell.screens
  PanelWindow {
    id: background
    required property ShellScreen modelData
    screen: modelData

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.namespace: "shell:background"

    anchors {
      top: true
      bottom: true
      left: true
      right: true
    }

    Image {
      anchors.fill: parent
      source: ShellGlobals.backgroundImage
    }
  }
}
