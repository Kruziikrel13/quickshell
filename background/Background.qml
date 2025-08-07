import qs
import qs.components
import QtQuick
import Quickshell
import Quickshell.Wayland

Loader {
  active: !!ShellGlobals.backgroundImage
  Variants {
    model: Quickshell.screens

    StyledWindow {
      name: "background"
      required property ShellScreen modelData
      screen: modelData

      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.exclusionMode: ExclusionMode.Ignore
      color: "black"

      anchors {
        top: true
        bottom: true
        left: true
        right: true
      }

      Image {
        anchors.fill: parent
        source: `${Quickshell.shellDir}/assets/${ShellGlobals.backgroundImage}`
        fillMode: Image.PreserveAspectCrop
      }
    }
  }
}
