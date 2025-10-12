import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.services
import qs.components

LazyLoader {
  active: WallpaperService.getWallpaperPath() !== ""
  Variants {
    model: Quickshell.screens

    StyledWindow {
      id: background
      name: "background"
      screen: modelData
      visible: img.visible
      required property ShellScreen modelData

      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.exclusionMode: ExclusionMode.Ignore

      anchors {
        top: true
        bottom: true
        left: true
        right: true
      }

      WallpaperImage {
        id: img
      }
    }
  }
}
