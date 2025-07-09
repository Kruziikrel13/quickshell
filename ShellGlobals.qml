pragma Singleton

import Quickshell
import QtQuick

Singleton {
  readonly property int normalSize: 16
  readonly property var sizes: QtObject {
    readonly property real barHeight: 40
    readonly property var icons: QtObject {
      readonly property int smallest: smaller - 2
      readonly property int smaller: normal - 4
      readonly property int normal: normalSize
      readonly property int large: normal + 4
      readonly property int larger: large + 2
      readonly property int largest: larger + 2
    }
    readonly property var font: QtObject {
      readonly property int smallest: smaller - 2
      readonly property int smaller: normal - 4
      readonly property int normal: normalSize
      readonly property int large: normal + 4
      readonly property int larger: large + 2
      readonly property int largest: larger + 2
    }
  }

  readonly property var font: QtObject {
    readonly property QtObject family: QtObject {
      property string main: "NotoSans Nerd Font Propo"
      property string monospace: "Jetbrains Mono Nerd Font"
      property string icons: "NotoSans Nerd Font Mono"
    }
  }

  readonly property var colors: QtObject {
    readonly property color background: "#141414"
    readonly property color onbackground: "#C4C4C4"
    readonly property color foreground: "#151517"
    readonly property color primary: "#51A4E7"
    readonly property color secondary: "#525252"
    readonly property color fontPrimary: "#FFFFFF"
  }
}
