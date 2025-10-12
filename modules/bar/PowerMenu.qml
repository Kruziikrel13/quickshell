import QtQuick
import Quickshell.Widgets
import qs.common
import qs.config
import qs.components

BarWidget {
  id: root

  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: GlobalState.showPowerMenu = !GlobalState.showPowerMenu
    hoverEnabled: true
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.yellow : StyleConfig.colourscheme.red
      text: ""
    }
  }
}
