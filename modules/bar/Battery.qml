//@ pragma Internal
import QtQuick
import Quickshell.Services.UPower
import qs.components

BarWidget {
  id: root
  visible: loader.active
  Loader {
    id: loader
    active: UPower.displayDevice !== null && UPower.displayDevice.ready && UPower.displayDevice.isLaptopBattery
    sourceComponent: StyledText {
      readonly property UPowerDevice battery: UPower.displayDevice
      text: {
        const percentage = battery.percentage;

        if (battery.percentage > 0 && battery.percentage <= 0.15) {
          return " ";
        } else if (battery.percentage > 0.15 && battery.percentage <= 0.35) {
          return " ";
        } else if (battery.percentage > 0.35 && battery.percentage <= 0.55) {
          return " ";
        } else if (battery.percentage > 0.55 && battery.percentage <= 0.75) {
          return " ";
        } else if (battery.percentage > 0.75 && battery.percentage <= 1) {
          return " ";
        } else {
          return " ";
        }
      }
    }
  }
}
