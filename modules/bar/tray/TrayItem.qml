//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs
import qs.config

WrapperMouseArea {
  id: root
  required property SystemTrayItem item
  property var bar: root.QsWindow.window
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
    anchor.window: root.bar
    anchor.rect.x: root.x + root.bar.width
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
    implicitSize: StyleConfig.font.pixelSize.larger
  }
}
