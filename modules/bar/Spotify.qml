//@ pragma Internal
pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs
import qs.config
import qs.services
import qs.components

Loader {
  active: SpotifyController.activeTrack !== null
  anchors.verticalCenter: parent.verticalCenter
  sourceComponent: WrapperMouseArea {
    id: mouseArea
    hoverEnabled: true
    acceptedButtons: Qt.RightButton
    onClicked: event => {
      event.accepted = true;
      switch (event.button) {
      case Qt.RightButton:
        Quickshell.execDetached(["hyprctl", "dispatch", "focuswindow", "class:spotify"]);
        break;
      }
    }
    RowLayout {
      ClippingWrapperRectangle {
        visible: SpotifyController.activeTrack.artUrl !== ""
        radius: width / 4
        StyledIcon {
          size: Styleconfig.font.pixelSize.huge
          source: SpotifyController.activeTrack.artUrl
          mipmap: true
        }
      }
      StyledText {
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
