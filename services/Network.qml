pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Networking
import QtQuick

Singleton {
  id: root

  // TODO: Add null protections
  readonly property NetworkDevice adapter: Networking.devices.values[0];
  readonly property bool wifi: adapter.type === DeviceType.Wifi;
  readonly property bool connected: adapter.connected;
  readonly property WifiNetwork activeNetwork: adapter.networks.values.find(network => network.connected);
  readonly property real strength: activeNetwork.signalStrength;

}
