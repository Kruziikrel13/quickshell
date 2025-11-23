import Quickshell.Widgets

WrapperRectangle {
  id: root
  anchors.verticalCenter: parent.verticalCenter
  color: "transparent"
  property real verticalMargin: 0
  property real horizontalMargin: 0
  topMargin: verticalMargin
  bottomMargin: verticalMargin
  leftMargin: horizontalMargin
  rightMargin: horizontalMargin
  radius: verticalMargin > 0 || horizontalMargin > 0 ? 8 : 0
}
