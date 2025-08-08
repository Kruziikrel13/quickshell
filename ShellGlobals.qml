pragma Singleton

import Quickshell
import QtQuick

/**
 * ShellGlobals Singleton
 * Provides global UI constants for sizing, fonts, and colors.
 *
 * Properties:
 * - normalSize: Base size for UI elements.
 * - sizes: Grouped sizing values for bars, icons, and fonts.
 * - font: Font families for main, monospace, and icons.
 * - colors: Color palette for backgrounds, foregrounds, and accents.
 */

Singleton {
  id: root

  /**
   * Base font and icon size for UI elements.
   */
  readonly property int normalSize: 16

  /**
   * Shell Background Image
   */
  readonly property string backgroundImage: "sunnymountains.jpg"

  /**
   * Sizing constants for bars, icons, and fonts.
   */
  readonly property var sizes: QtObject {
    readonly property real barHeight: 40
    readonly property var icons: QtObject {
      readonly property int smallest: smaller - 2
      readonly property int smaller: small - 2
      readonly property int small: normal - 4
      readonly property int normal: root.normalSize
      readonly property int large: normal + 4
      readonly property int larger: large + 2
      readonly property int largest: larger + 2
    }
    readonly property var font: QtObject {
      readonly property int smallest: smaller - 2
      readonly property int smaller: small - 2
      readonly property int small: normal - 4
      readonly property int normal: root.normalSize
      readonly property int large: normal + 4
      readonly property int larger: large + 2
      readonly property int largest: larger + 2
    }
  }

  /**
   * Font families for different UI elements.
   */
  readonly property var font: QtObject {
    readonly property QtObject family: QtObject {
      property string main: "NotoSans Nerd Font Propo"
      property string monospace: "Jetbrains Mono Nerd Font"
      property string icons: "NotoSans Nerd Font Mono"
    }
  }

  /**
   * Color palette for UI components.
   */
  readonly property var colors: QtObject {
    readonly property color background: "#141414"
    readonly property color onbackground: "#C4C4C4"
    readonly property color foreground: "#151517"
    readonly property color primary: "#51A4E7"
    readonly property color secondary: "#525252"
    readonly property color fontPrimary: "#FFFFFF"
  }
}
