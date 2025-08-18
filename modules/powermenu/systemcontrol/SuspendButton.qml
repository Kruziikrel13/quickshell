//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.components
import qs.config

WrapperMouseArea {
  id: root
  hoverEnabled: true
  onClicked: Quickshell.execDetached(["systemctl", "suspend"])
  Rectangle {
    implicitWidth: 50
    implicitHeight: 50
    radius: 10
    color: root.containsMouse ? StyleConfig.colourscheme.blue : Qt.lighter(StyleConfig.colourscheme.background, 2)
    StyledText {
      anchors.centerIn: parent
      text: ""
      font.pixelSize: StyleConfig.font.pixelSize.huge
    }
  }
}
