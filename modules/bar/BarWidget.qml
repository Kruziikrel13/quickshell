import Quickshell.Widgets
import qs.config

WrapperRectangle {
  id: root
  anchors.verticalCenter: parent.verticalCenter
  color: BarConfig.showWidgetBackground ? BarConfig.widgetBackground : "transparent"
  property real verticalMargin: BarConfig.showWidgetBackground ? 5 : 0
  property real horizontalMargin: BarConfig.showWidgetBackground ? 10 : 0
  topMargin: verticalMargin
  bottomMargin: verticalMargin
  leftMargin: horizontalMargin
  rightMargin: horizontalMargin
  radius: verticalMargin > 0 || horizontalMargin > 0 ? 8 : 0
}
