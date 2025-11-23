//@ pragma Internal
import QtQuick
import QtQuick.Layouts

import qs.services
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: rowLayout.implicitWidth
  implicitHeight: Appearance.sizes.barSize

  property bool showDate: true

  RowLayout {
    id: rowLayout
    anchors.centerIn: parent

    StyledText {
      text: TimeService.time
    }

    StyledText {
      visible: root.showDate
      text: "•"
    }

    StyledText {
      visible: root.showDate
      text: TimeService.date
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true

    // TODO: Add Popup
  }
}
