import QtQuick
import QtQuick.Layouts
import ".."

Rectangle {
  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredWidth: 1
  color: ShellGlobals.colors.foreground
  property alias layoutDirection: content.layoutDirection
  default property alias moduleItems: content.data

  property bool center: false

  Row {
    id: content
    spacing: 7.5
    padding: 12.5
    anchors {
      fill: parent.center ? undefined : parent
      centerIn: parent.center ? parent : undefined
    }
  }
}
