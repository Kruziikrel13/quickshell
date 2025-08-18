//@ pragma Internal
import QtQuick
import Quickshell.Io
import qs.components

StyledText {
  id: root
  property string uptime: "00:00:00"
  text: qsTr(" " + root.uptime)
  Timer {
    interval: 10
    running: true
    repeat: true
    onTriggered: {
      fileUptime.reload();

      const textUptime = fileUptime.text();
      const uptimeSeconds = Number(textUptime.split(" ")[0] ?? 0);

      // Convert seconds to days, hours, and minutes
      const days = Math.floor(uptimeSeconds / 86400);
      const hours = Math.floor((uptimeSeconds % 86400) / 3600);
      const minutes = Math.floor((uptimeSeconds % 3600) / 60);
      const seconds = Math.floor((uptimeSeconds % 60));

      // Build the formatted uptime string
      let formatted = "";
      if (days > 0)
        formatted += `${days}d`;
      if (hours > 0)
        formatted += `${formatted ? ":" : ""}${String(hours).padStart(2, "0")}`;
      if (minutes > 0 || !formatted)
        formatted += `${formatted ? ":" : ""}${String(minutes).padStart(2, "0")}`;
      if (seconds > 0 || !formatted)
        formatted += `${formatted ? ":" : ""}${String(seconds).padStart(2, "0")}`;
      root.uptime = formatted;
    }
  }

  FileView {
    id: fileUptime
    path: "/proc/uptime"
  }
}
