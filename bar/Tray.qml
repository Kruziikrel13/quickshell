pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import qs

// NOTE: Use an item instead of WrapperItem?
WrapperItem {
  id: root
  visible: SystemTray.items.values.length > 0
  required property PanelWindow bar
  anchors.verticalCenter: parent.verticalCenter

  RowLayout {
    spacing: 5

    Repeater {
      model: SystemTray.items

      WrapperMouseArea {
        id: mouseArea
        required property var modelData
        property bool targetMenuOpen: false
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

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
          menu: mouseArea.modelData.menu
          anchor.window: root.bar
          anchor.rect.x: mouseArea.x + root.bar.width
          anchor.rect.y: mouseArea.y
          anchor.rect.height: mouseArea.height
          anchor.edges: Edges.Bottom
        }

        IconImage {
          source: {
            let icon = mouseArea.modelData.icon;
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
    }
  }
}
