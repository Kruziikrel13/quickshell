pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Singleton {
  id: root
  property var colours
  property QtObject font
  property QtObject sizes

  property var colourscheme: colours.darkmode ? colours.dark : colours.light

  colours: QtObject {
    property bool darkmode: true // Unhandled
    property bool transparent: false // Unhandled

    property QtObject dark: QtObject {
      property color background: "#151519"
      property color foreground: "#b2b5b3"

      property color selectBackground: "#EBFF71"
      property color selectForeground: "#313234"

      property color cursorBackground: "#eaeaea"
      property color cursorForeground: "#373839"

      property color black: "#373839"
      property color red: "#e55f86"
      property color green: "#00D787"
      property color yellow: "#EBFF71"
      property color blue: "#50a4e7"
      property color magenta: "#9076e7"
      property color cyan: "#50e6e6"
      property color pink: "#e781d6"
      property color white: "#e7e7e7"

      property color brightBlack: "#313234"
      property color brightRed: "#d15577"
      property color brightGreen: "#43c383"
      property color brightYellow: "#d8e77b"
      property color brightBlue: "#4886c8"
      property color brightMagenta: "#8861dd"
      property color brightCyan: "#43c3c3"
      property color brightPink: "#d76dc5"
      property color brightWhite: "#c1c4c2"
    }

    property QtObject light: QtObject {
      property color foreground: "#171717"
      property color background: "#fafafa"

      property color selectBackground: "#f6d32d"
      property color selectForeground: "#313234"

      property color cursorBackground: "#171717"
      property color cursorForeground: "#fafafa"

      property color black: "#afafb0"
      property color red: "#f66151"
      property color green: "#33d17a"
      property color yellow: "#f6d32d"
      property color blue: "#62a0ea"
      property color magenta: "#9141ac"
      property color cyan: "#47b496"
      property color white: "#3b3c3d"

      property color brightBlack: "#bdbebf"
      property color brightRed: "#dd5742"
      property color brightGreen: "#29bd6b"
      property color brightYellow: "#ddbf23"
      property color brightBlue: "#5891d6"
      property color brightMagenta: "#82379d"
      property color brightCyan: "#3da087"
      property color brightWhite: "#2d2d2e"
    }
  }

  sizes: QtObject {
    property real barHeight: 40
    property real barGroupHeight: 32
    property real osdWidth: 200
    property real notificationPopupWidth: 410
  }

  font: QtObject {
    property QtObject family: QtObject {
      property string main: "NotoSans Nerd Font Propo"
      property string monospace: "Jetbrains Mono Nerd Font"
      property string icons: "NotoSans Nerd Font Mono"
    }
    property QtObject pixelSize: QtObject {
      property int smallest: smaller - 2
      property int smaller: small - 3
      property int small: normal - 1
      readonly property int normal: 16
      property int large: normal + 1
      property int larger: large + 2
      property int huge: larger + 3
      property int hugeass: huge + 1
      property int title: huge
    }
  }
}
