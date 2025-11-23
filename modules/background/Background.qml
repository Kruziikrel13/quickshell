import QtQuick
import Quickshell
import Quickshell.Wayland

LazyLoader {
  // TODO: Add util for checking if file exists and only loading if it does
  active: true
  Variants {
    model: Quickshell.screens

    PanelWindow {
      WlrLayershell.namespace: "shell:background"
      required property ShellScreen modelData
      screen: modelData

      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.exclusionMode: ExclusionMode.Ignore

      anchors {
        top: true
        right: true
        left: true
        bottom: true
      }

      Image {
        anchors.fill: parent
        source: Quickshell.env("HOME") + "/.wallpaper.png"
        fillMode: Image.PreserveAspectCrop
        cache: true
        smooth: true
        mipmap: false
      }
    }
  }
}
