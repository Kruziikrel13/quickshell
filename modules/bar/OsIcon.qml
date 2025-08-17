//@ pragma Internal
import Quickshell
import QtQuick
import qs.config
import qs.services
import qs.components

BarWidget {
  StyledIcon {
    size: StyleConfig.font.pixelSize.huge
    source: Qt.resolvedUrl(Quickshell.shellPath("assets/icons")) + "/" + SystemInfo.distroIcon + ".svg"
  }
}
