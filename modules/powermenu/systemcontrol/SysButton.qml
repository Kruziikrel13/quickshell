//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.components
import qs.config

WrapperMouseArea {
  id: root
  hoverEnabled: true
  required property string command
  required property string text
  property alias color: text.color
  property alias size: content.implicitWidth
  onClicked: Quickshell.execDetached(command.split(" "))
  Rectangle {
    id: content
    implicitWidth: 50
    implicitHeight: content.implicitWidth
    radius: 10
    color: root.containsMouse ? StyleConfig.colourscheme.blue : Qt.lighter(StyleConfig.colourscheme.background, 2)
    StyledText {
      id: text
      anchors.centerIn: parent
      text: root.text
      font.pixelSize: StyleConfig.font.pixelSize.huge
    }
  }
}
