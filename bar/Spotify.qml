//@ pragma Internal

import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs
import qs.services
import qs.components

Loader {
  active: SpotifyController.active
  anchors.verticalCenter: parent.verticalCenter
  sourceComponent: WrapperMouseArea {
    id: mouseArea
    hoverEnabled: true
    RowLayout {
      spacing: 10
      ClippingWrapperRectangle {
        visible: !!SpotifyController.trackIcon
        radius: icon.width / 4
        StyledIcon {
          id: icon
          size: ShellGlobals.sizes.icons.larger
          source: SpotifyController.trackIcon
          mipmap: true
          asynchronous: false
        }
      }
      StyledText {
        text: SpotifyController.getTrackInfo(50)
        color: mouseArea.containsMouse ? ShellGlobals.colors.primary : defaultColor
      }
    }
  }
}
