pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Services.Pam
import qs
import qs.utils
import qs.services

Loader {
  id: loader
  active: false // Lock screen on initial startup

  IdleMonitor {
    id: monitor
    enabled: !loader.active
    timeout: Settings.lockTimeout
    respectInhibitors: true
    onIsIdleChanged: {
      if (isIdle) {
        loader.active = true;
      }
    }
  }

  GlobalShortcut {
    appid: "shell"
    name: "lockscreen"
    description: "Desktop Lock Screen"
    onPressed: {
      loader.active = true;
    }
  }

  Timer {
    id: unloadAfterUnlockTimer
    interval: 250
    repeat: false
    onTriggered: loader.active = false
  }

  function scheduleUnloadAfterUnlock() {
    unloadAfterUnlockTimer.start();
  }

  sourceComponent: Component {
    Item {
      id: container

      IdleMonitor {
        enabled: loader.active
        timeout: Settings.suspendTimeout
        onIsIdleChanged: {
          if (isIdle) {
            Quickshell.execDetached(["systemctl", "suspend"]);
          }
        }
      }
      Context {
        id: context
        onUnlocked: {
          session.locked = false;
          loader.scheduleUnloadAfterUnlock();
          context.currentText = "";
        }
        onFailed: {
          context.currentText = "";
        }
      }

      WlSessionLock {
        id: session
        locked: loader.active

        WlSessionLockSurface {
          Image {
            anchors.fill: parent
            source: WallpaperService.getWallpaperPath()
            cache: true
            smooth: true
            mipmap: false
          }

          Rectangle {
            anchors.fill: parent
            gradient: Gradient {
              GradientStop {
                position: 0.0
                color: Qt.alpha("black", 0.8)
              }
              GradientStop {
                position: 0.3
                color: Qt.alpha("black", 0.4)
              }
              GradientStop {
                position: 0.7
                color: Qt.alpha("black", 0.5)
              }
              GradientStop {
                position: 1.0
                color: Qt.alpha("black", 0.9)
              }
            }
          }

          Item {
            anchors.fill: parent
            ClippingWrapperRectangle {
              anchors.centerIn: parent
              anchors.verticalCenterOffset: -256
              radius: 32
              Image {
                source: ShellSettings.general.avatarImage
                sourceSize: Qt.size(256, 256)
              }
            }

            TextInput {
              width: 0
              height: 0
              visible: false
              enabled: !context.unlockInProgress
              echoMode: TextInput.Password
              text: context.currentText
              onTextChanged: context.currentText = text

              Keys.onPressed: event => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                  context.tryUnlock();
                } else if (event.key === Qt.Key_Escape) {
                  text = "8104";
                  context.tryUnlock();
                }
              }

              Component.onCompleted: forceActiveFocus()
            }
          }
        }
      }
    }
  }
}
