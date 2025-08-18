import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config
import qs.components
import ".."

BarWidget {
  id: root

  WrapperMouseArea {
    id: mouseArea
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: Quickshell.execDetached(["quickshell", "ipc", "call", "powermenu", "toggle"])
    hoverEnabled: true
    StyledText {
      color: mouseArea.containsMouse ? StyleConfig.colourscheme.yellow : StyleConfig.colourscheme.red
      text: ""
    }
  }
}
