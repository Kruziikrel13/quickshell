//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.modules.common

WrapperMouseArea {
  id: root
  required property SystemTrayItem item
  acceptedButtons: Qt.LeftButton | Qt.RightButton
  onClicked: event => {
    event.accepted = true;
    switch (event.button) {
    case Qt.LeftButton:
      item.activate();
      break;
    case Qt.MiddleButton:
      item.secondaryActivate();
      break;
    case Qt.RightButton:
      if (item.hasMenu)
        menu.open();
      break;
    }
  }
  // TODO: Rewrite and manually create Tray Menu instead of using QsMenuAnchor
  QsMenuAnchor {
    id: menu
    menu: root.item.menu
    anchor.item: root
    anchor.rect.x: root.x
    anchor.rect.y: root.y
    anchor.rect.height: root.height
    anchor.edges: Edges.Bottom
  }

  IconImage {
    source: {
      let icon = root.item.icon;
      if (icon.includes("?path=")) {
        const [name, path] = icon.split("?path=");
        icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
      }
      return icon;
    }
    asynchronous: true
    implicitSize: Appearance.font.pixelSize.larger
  }
}
