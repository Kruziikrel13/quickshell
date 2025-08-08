pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property bool wifi: true
  property bool ethernet: false
  property int updateInterval: 1000
  property string networkName: ""
  property int networkStrength

  function update() {
    updateConnectionType.startCheck();
  }

  Timer {
    interval: 10
    running: true
    repeat: true
    onTriggered: {
      root.update();
      interval = root.updateInterval;
    }
  }
  Process {
    id: updateConnectionType
    property string buffer
    command: ["sh", "-c", "nmcli -t -f NAME,TYPE,DEVICE c show --active"]
    running: true
    function startCheck() {
      buffer = "";
      updateConnectionType.running = true;
    }
    stdout: SplitParser {
      onRead: data => {
        updateConnectionType.buffer += data + "\n";
      }
    }
    onExited: (exitCode, exitStatus) => {
      const lines = updateConnectionType.buffer.trim().split('\n');
      let hasEthernet = false;
      let hasWifi = false;
      lines.forEach(line => {
        if (line.includes("ethernet"))
          hasEthernet = true;
        else if (line.includes("wireless"))
          hasWifi = true;
      });
      root.ethernet = hasEthernet;
      root.wifi = hasWifi;
    }
  }
}
