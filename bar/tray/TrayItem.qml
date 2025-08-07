//@ pragma Internal
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs

WrapperMouseArea {
  id: root
  required property SystemTrayItem modelData
  required property PanelWindow bar
  acceptedButtons: Qt.LeftButton | Qt.RightButton
  onClicked: event => {
    event.accepted = true;
    switch (event.button) {
    case Qt.LeftButton:
      modelData.activate();
      break;
    case Qt.MiddleButton:
      modelData.secondaryActivate();
      break;
    case Qt.RightButton:
      if (modelData.hasMenu)
        menu.open();
      break;
    }
  }
  // TODO: Rewrite and manually create Tray Menu instead of using QsMenuAnchor
  QsMenuAnchor {
    id: menu
    menu: root.modelData.menu
    anchor.window: root.bar
    anchor.rect.x: root.x + root.bar.width
    anchor.rect.y: root.y
    anchor.rect.height: root.height
    anchor.edges: Edges.Bottom
  }

  IconImage {
    source: {
      let icon = root.modelData.icon;
      if (icon.includes("?path=")) {
        const [name, path] = icon.split("?path=");
        icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
      }
      return icon;
    }
    asynchronous: true
    implicitSize: ShellGlobals.sizes.font.normal * 1.1
  }
}
