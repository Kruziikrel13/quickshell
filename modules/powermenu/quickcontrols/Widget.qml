import QtQuick
import QtQuick.Layouts

import qs.modules.common

Rectangle {
  id: root
  anchors.left: parent.left
  anchors.right: parent.right
  radius: 10
  color: Qt.lighter(Appearance.colours.background, 1.4)
  implicitHeight: 50
  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 5
    Volume {
      Layout.fillWidth: true
    }
    Microphone {
      Layout.fillWidth: true
    }
  }
}
