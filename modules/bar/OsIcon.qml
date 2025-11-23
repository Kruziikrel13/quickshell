//@ pragma Internal
import QtQuick

import qs.services
import qs.modules.common
import qs.modules.common.widgets

Item {
  id: root
  implicitWidth: icon.implicitWidth
  implicitHeight: Appearance.sizes.barHeight

  StyledIcon {
    id: icon
    anchors.centerIn: parent
    size: Appearance.font.pixelSize.huge
    icon: SystemInfo.distroIcon + ".svg"
  }
}
