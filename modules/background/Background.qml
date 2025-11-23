import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.modules.common.widgets

LazyLoader {
  // TODO: Add util for checking if file exists and only loading if it does
  active: true
  Variants {
    model: Quickshell.screens

    StyledWindow {
      name: "background"
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
