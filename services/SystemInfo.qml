pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io

/**
 * System Information: Automated!
 * Borrowed heavily from https://github.com/end-4/dots-hyprland/blob/main/.config/quickshell/ii/services/SystemInfo.qml
 */

Singleton {
  id: root
  property string distroName: "Unknown"
  property string distroId: "unknown"
  property string distroIcon: "linux-symbolic"
  property string username: "user"

  Timer {
    triggeredOnStart: true
    interval: 1
    running: true
    repeat: false
    onTriggered: {
      getUsername.running = true;
      fileOsRelease.reload();
      const textOsRelease = fileOsRelease.text();

      // Extract the friendly name (PRETTY_NAME field, fallback to NAME)
      const prettyNameMatch = textOsRelease.match(/^PRETTY_NAME="(.+?)"/m);
      const nameMatch = textOsRelease.match(/^NAME="(.+?)"/m);
      root.distroName = prettyNameMatch ? prettyNameMatch[1] : (nameMatch ? nameMatch[1].replace(/Linux/i, "").trim() : "Unknown");

      // Extract the ID
      const idMatch = textOsRelease.match(/^ID="?(.+?)"?$/m);
      root.distroId = idMatch ? idMatch[1] : "unknown";

      switch (root.distroId) {
      case "nixos":
        root.distroIcon = "nixos-symbolic";
        break;
      case "arch":
        root.distroIcon = "arch-symbolic";
        break;
      case "ubuntu":
        root.distroIcon = "ubuntu-symbolic";
        break;
      default:
        root.distroIcon = "linux-symbolic";
        break;
      }
    }
  }

  Process {
    id: getUsername
    command: ["whoami"]
    stdout: SplitParser {
      onRead: data => {
        root.username = data.trim();
      }
    }
  }

  FileView {
    id: fileOsRelease
    path: "/etc/os-release"
  }
}
