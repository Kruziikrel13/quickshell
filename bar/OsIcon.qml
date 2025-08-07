//@ pragma Internal
import Quickshell
import QtQuick
import qs.services
import qs.components
import qs

StyledIcon {
  anchors.verticalCenter: parent.verticalCenter
  size: ShellGlobals.sizes.icons.larger
  source: Qt.resolvedUrl(Quickshell.shellPath("assets/icons")) + "/" + SystemInfo.distroIcon + ".svg"
}
