//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: text.implicitWidth
  implicitHeight: Appearance.sizes.barHeight

  PersistentProperties {
    id: persist
    reloadableId: "barIdleInhibit"
    property bool inhibit: false
  }

  IdleInhibitor {
    id: idleInhibitor
    enabled: persist.inhibit
    window: PanelWindow {
      implicitWidth: 0
      implicitHeight: 0
      color: "transparent"
      anchors {
        right: true
        bottom: true
      }
      mask: Region {
        item: null
      }
    }
  }

  StyledText {
    id: text
    anchors.centerIn: parent
    color: (persist.inhibit || mouseArea.containsMouse) ? Appearance.colours.primary : Appearance.colours.on_background
    text: ""
  }

  MouseArea {
    id: mouseArea
    hoverEnabled: true
    anchors.fill: parent
    onClicked: persist.inhibit = !persist.inhibit
  }
  // WrapperMouseArea {
  //   id: mouseArea
  //   acceptedButtons: Qt.LeftButton
  //   hoverEnabled: true
  //   onClicked: event => {
  //     event.accepted = true;
  //     IdleService.toggleInhibit();
  //   }
  //
  //   StyledText {
  //     color: IdleService.inhibit ? StyleConfig.colourscheme.accent : defaultColor
  //     text: ""
  //   }
  // }
}
