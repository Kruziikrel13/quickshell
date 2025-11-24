//@ pragma Internal
import QtQuick
import Quickshell.Hyprland
import Quickshell.Widgets

import qs.modules.common

WrapperMouseArea {
  id: root
  required property HyprlandWorkspace modelData
  anchors.verticalCenter: parent.verticalCenter
  onClicked: modelData.activate()
  readonly property int normalSize: Appearance.font.pixelSize.normal
  readonly property int smallSize: Math.round(Appearance.font.pixelSize.normal * 0.75)
  Rectangle {
    readonly property bool empty: root.modelData.toplevels.values.length <= 0
    readonly property bool focused: root.modelData.focused

    implicitHeight: (focused || !empty) ? root.normalSize : root.smallSize
    implicitWidth: {
      if (focused && !empty)
        return Math.round(Appearance.font.pixelSize.normal * 1.5);
      if (!empty)
        return root.normalSize;
      return root.smallSize;
    }
    color: {
      if (focused)
        return Appearance.colours.primary;
      if (!empty)
        return Appearance.colours.on_background;
      return Appearance.colours.background;
    }
    radius: height / 4

    Behavior on implicitWidth {
      NumberAnimation {
        duration: 100
        easing.type: Easing.Linear
      }
    }
    Behavior on implicitHeight {
      NumberAnimation {
        duration: 100
        easing.type: Easing.Linear
      }
    }
  }
}
