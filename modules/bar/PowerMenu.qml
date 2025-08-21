import QtQuick
import Quickshell.Widgets
import qs
import qs.config
import qs.components

BarWidget {
  id: root

  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: GlobalStates.powermenu("toggle")
    hoverEnabled: true
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.yellow : StyleConfig.colourscheme.red
      text: ""
    }
  }
}
