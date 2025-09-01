//@ pragma Internal
import QtQuick
import Quickshell.Hyprland
import Quickshell.Widgets
import qs.config

WrapperMouseArea {
  id: root
  required property HyprlandWorkspace modelData
  anchors.verticalCenter: parent.verticalCenter
  onClicked: modelData.activate()
  readonly property int normalSize: StyleConfig.font.pixelSize.normal
  readonly property int smallSize: Math.round(StyleConfig.font.pixelSize.normal * 0.75)
  Rectangle {
    readonly property bool empty: root.modelData.toplevels.values.length <= 0
    readonly property bool focused: root.modelData.focused

    implicitHeight: (focused || !empty) ? root.normalSize : root.smallSize
    implicitWidth: {
      if (focused && !empty)
        return Math.round(StyleConfig.font.pixelSize.normal * 1.5);
      if (!empty)
        return root.normalSize;
      return root.smallSize;
    }
    color: {
      if (focused)
        return StyleConfig.colourscheme.blue;
      if (!empty)
        return StyleConfig.colourscheme.white;
      return StyleConfig.colourscheme.black;
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
