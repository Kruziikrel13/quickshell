//@ pragma Internal
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import qs.services
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: loader.implicitWidth
  implicitHeight: Appearance.sizes.barHeight
  visible: loader.active
  Loader {
    id: loader
    active: SpotifyController.activeTrack !== null
    anchors.centerIn: parent
    sourceComponent: WrapperMouseArea {
      id: mouseArea
      hoverEnabled: true
      acceptedButtons: Qt.LeftButton | Qt.RightButton
      onClicked: Quickshell.execDetached(["hyprctl", "dispatch", "focuswindow", "class:spotify"])
      RowLayout {
        ClippingWrapperRectangle {
          visible: SpotifyController.activeTrack.artUrl !== ""
          radius: 4
          StyledIcon {
            size: Appearance.font.pixelSize.huge
            source: SpotifyController.activeTrack.artUrl
            mipmap: true
            backer.fillMode: Image.PreserveAspectCrop
            backer.cache: false
          }
        }
        StyledText {
          Layout.maximumWidth: 300
          color: mouseArea.containsMouse ? Appearance.colours.primary : Appearance.colours.on_background
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
