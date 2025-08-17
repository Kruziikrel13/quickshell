//@ pragma Internal

import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.config
import qs.components
import qs.services

BarWidget {
  id: root
  visible: loader.active
  Loader {
    id: loader
    active: Audio.ready
    sourceComponent: WrapperMouseArea {
      id: mouseArea
      acceptedButtons: Qt.LeftButton | Qt.RightButton
      hoverEnabled: true
      onClicked: event => {
        event.accepted = true;
        switch (event.button) {
        case Qt.LeftButton:
          Quickshell.execDetached(["bash", "-c", `wpctl set-mute ${Audio.sink?.id} toggle`]);
          break;
        case Qt.RightButton:
          Quickshell.execDetached(["ghostty", "--class=ghostty.tui", "-e", "pulsemixer"]);
          break;
        }
      }
      StyledText {
        color: mouseArea.containsMouse ? StyleConfig.colourscheme.blue : defaultColor
        text: {
          if (!Audio.ready)
            return "";
          const volume = Audio.sink?.audio.volume;
          if (Audio.sink?.audio.muted || volume <= 0) {
            return "";
          }
          if (volume > 0 && volume <= 0.2) {
            return "";
          } else if (volume > 0.2 && volume <= 0.45) {
            return "";
          } else if (volume > 0.45) {
            return "";
          }
          // Failed to get audio info, show error
          return "";
        }
      }
    }
  }
}
