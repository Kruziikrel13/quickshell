//@ pragma Internal
import QtQuick
import QtQuick.Layouts

Item {
  id: root
  Layout.fillWidth: true
  Layout.fillHeight: true
  Layout.preferredWidth: 1
  property alias layoutDirection: content.layoutDirection
  default property alias moduleItems: content.data

  property bool center: false

  Row {
    id: content
    spacing: 7.5
    padding: 12.5
    anchors {
      fill: root.center ? undefined : root
      centerIn: root.center ? root : undefined
    }
  }
}
