//@ pragma Internal
import qs.config
import QtQuick
import Quickshell.Hyprland
import Quickshell.Widgets

WrapperMouseArea {
  id: root
  required property HyprlandWorkspace modelData
  onClicked: modelData.activate()
  Rectangle {
    readonly property bool empty: root.modelData.toplevels.values.length <= 0
    readonly property bool focused: root.modelData.focused

    implicitHeight: (focused || !empty) ? StyleConfig.font.pixelSize.normal : StyleConfig.font.pixelSize.normal * 0.75
    implicitWidth: {
      if (focused && !empty)
        return StyleConfig.font.pixelSize.normal * 2;
      if (!empty)
        return StyleConfig.font.pixelSize.normal;
      return StyleConfig.font.pixelSize.normal * 0.75;
    }
    color: {
      if (focused)
        return StyleConfig.colourscheme.blue;
      if (!empty)
        return StyleConfig.colourscheme.foreground;
      return StyleConfig.colourscheme.black;
    }

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
