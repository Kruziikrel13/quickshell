//@ pragma Internal

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs
import qs.services
import qs.components

WrapperMouseArea {
  id: mouseArea
  visible: SpotifyController.active
  anchors.verticalCenter: parent.verticalCenter
  hoverEnabled: true
  acceptedButtons: Qt.LeftButton
  onClicked: Quickshell.execDetached(["hyprctl", "dispatch", "focuswindow", "class:spotify"])
  RowLayout {
    spacing: 10
    Loader {
      active: SpotifyController.activeTrack?.artUrl ?? false
      sourceComponent: ClippingWrapperRectangle {
        radius: width / 4
        StyledIcon {
          size: ShellGlobals.sizes.icons.larger
          source: SpotifyController.activeTrack.artUrl
          mipmap: true
        }
      }
    }

    Loader {
      active: SpotifyController.activeTrack !== null
      sourceComponent: StyledText {
        text: {
          let track = SpotifyController.activeTrack;

          let info = "";

          if (track.artist) {
            info += track.artist;
          }

          if (track.title) {
            if (info.length > 0) {
              info += " - ";
            }
            info += track.title;
          }

          return info;
        }
        color: mouseArea.containsMouse ? ShellGlobals.colors.primary : defaultColor
      }
    }
  }
}
