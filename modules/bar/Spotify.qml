//@ pragma Internal

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.services
import qs.components

BarWidget {
  id: root
  visible: loader.active
  Loader {
    id: loader
    active: SpotifyController.activeTrack !== null
    sourceComponent: WrapperMouseArea {
      id: mouseArea
      hoverEnabled: true
      acceptedButtons: Qt.RightButton
      onClicked: Quickshell.execDetached(["hyprctl", "dispatch", "focuswindow", "class:spotify"])
      RowLayout {
        ClippingWrapperRectangle {
          visible: SpotifyController.activeTrack.artUrl !== ""
          radius: width / 4
          StyledIcon {
            size: StyleConfig.font.pixelSize.huge
            source: SpotifyController.activeTrack.artUrl
            mipmap: true
          }
        }
        StyledText {
          Layout.maximumWidth: 300
          color: mouseArea.containsMouse ? StyleConfig.colourscheme.blue : defaultColor
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
        }
      }
    }
  }
}
