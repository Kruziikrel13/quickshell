import QtQuick
import Quickshell.Widgets
import Quickshell.Hyprland
import qs.utils
import qs.config
import qs.components

BarWidget {
  id: root

  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: ShellStates.powermenu = !ShellStates.powermenu
    hoverEnabled: true
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.yellow : StyleConfig.colourscheme.red
      text: ""
    }
  }
}
