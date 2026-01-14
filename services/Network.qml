pragma Singleton

import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
  id: root

  readonly property NetworkDevice adapter: Networking.devices.values.find(device => device.connected)
  readonly property bool wifi: adapter ? adapter.type == DeviceType.Wifi : false
  readonly property bool connected: adapter ? adapter.connected : false
  readonly property WifiNetwork activeNetwork: {
    if (!root.wifi || !adapter)
      return;
    return adapter.networks.values.find(network => network.connected);
  }
  readonly property real strength: {
    if (!root.wifi || !activeNetwork)
      return 0.0;
    return activeNetwork.signalStrength;
  }
}
