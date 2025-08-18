import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
  id: root
  radius: 10
  color: Qt.lighter(StyleConfig.colourscheme.background, 1.4)
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
