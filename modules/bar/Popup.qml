//@pragma Internal

import QtQuick
import Quickshell
import Quickshell.Wayland

LazyLoader {
  id: root

  property MouseArea hoverTarget
  default property Item contentItem
  active: hoverTarget && hoverTarget.containsMouse

  component: PanelWindow {}
}
