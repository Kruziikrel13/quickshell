pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.common
import qs.services
import qs.components

Scope {
  id: root

  GlobalShortcut {
    appid: "shell"
    name: "lock"
    description: "Lock Screen"
    onPressed: () => {
      GlobalState.lockScreen();
    }
  }

  // Implemented here as this implements behaviour for lockScreen
  IpcHandler {
    target: "lock"

    function lockScreen(): void {
      GlobalState.lockScreen();
    }
  }

  Timer {
    id: unlockDelay
    interval: 250
    repeat: false
    onTriggered: GlobalState.screenLocked = false
  }

  function scheduleUnload() {
    unlockDelay.start();
  }

  Loader {
    id: loader
    active: GlobalState.screenLocked
    sourceComponent: Item {
      Context {
        id: ctx

        onUnlocked: {
          lock.locked = false;
          root.scheduleUnload();
          this.reset();
        }
      }

      WlSessionLock {
        id: lock
        locked: loader.active

        WlSessionLockSurface {
          color: "transparent"

          WallpaperImage {
            id: wallpaper
          }

          MultiEffect {
            source: wallpaper
            anchors.fill: wallpaper
            blurEnabled: true
            blurMax: 64
            blurMultiplier: -1.0
            blur: 1.0
          }

          MouseArea {
            anchors.fill: parent

            function forceFieldFocus() {
              passwordInput.forceActiveFocus();
            }

            hoverEnabled: true
            onPressed: forceFieldFocus()
            onPositionChanged: forceFieldFocus()
            Component.onCompleted: this.forceActiveFocus()

            StyledText {
              anchors.centerIn: parent
              anchors.verticalCenterOffset: -128
              font.pixelSize: 128
              bold: true
              text: TimeService.time
            }

            TextInput {
              id: passwordInput
              width: 0
              height: 0
              visible: false
              enabled: !ctx.unlockInProgress
              echoMode: TextInput.Password
              passwordCharacter: "•"
              passwordMaskDelay: 0
              text: ctx.currentText
              onTextChanged: ctx.currentText = text

              Keys.onPressed: event => {
                switch (event.key) {
                case Qt.Key_Return:
                case Qt.Key_Enter:
                  ctx.tryUnlock();
                  break;
                case Qt.Key_Escape:
                  ctx.reset();
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
}
