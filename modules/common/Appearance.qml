pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  property QtObject colours
  property QtObject font
  property QtObject rounding
  property QtObject sizes

  colours: QtObject {
    property color background: "#0e1415"
    property color on_background: "#dde4e4"
    property color primary: "#80d4db"
    property color on_primary: "#00363a"
    property color error: "#ffb4ab"
    property color error_container: "#93000a"
    property color inverse_on_surface: "#2b3232"
    property color inverse_primary: "#006970"
    property color inverse_surface: "#dde4e4"
    property color on_error: "#690005"
    property color on_error_container: "#ffdad6"
    property color on_primary_container: "#9df0f8"
    property color on_primary_fixed: "#002022"
    property color on_primary_fixed_variant: "#004f54"
    property color on_secondary: "#1b3436"
    property color on_secondary_container: "#cce8ea"
    property color on_secondary_fixed: "#051f21"
    property color on_secondary_fixed_variant: "#324b4d"
    property color on_surface: "#dde4e4"
    property color on_surface_variant: "#bec8c9"
    property color on_tertiary: "#21304c"
    property color on_tertiary_container: "#d7e2ff"
    property color on_tertiary_fixed: "#0a1b36"
    property color on_tertiary_fixed_variant: "#384764"
    property color outline: "#899393"
    property color outline_variant: "#3f4849"
    property color primary_container: "#004f54"
    property color primary_fixed: "#9df0f8"
    property color primary_fixed_dim: "#80d4db"
    property color scrim: "#000000"
    property color secondary: "#b1cbce"
    property color secondary_container: "#324b4d"
    property color secondary_fixed: "#cce8ea"
    property color secondary_fixed_dim: "#b1cbce"
    property color shadow: "#000000"
    property color source_color: "#239ea7"
    property color surface: "#0e1415"
    property color surface_bright: "#343a3b"
    property color surface_container: "#1a2121"
    property color surface_container_high: "#252b2c"
    property color surface_container_highest: "#303636"
    property color surface_container_low: "#161d1d"
    property color surface_container_lowest: "#090f10"
    property color surface_dim: "#0e1415"
    property color surface_tint: "#80d4db"
    property color surface_variant: "#3f4849"
    property color tertiary: "#b7c7ea"
    property color tertiary_container: "#384764"
    property color tertiary_fixed: "#d7e2ff"
    property color tertiary_fixed_dim: "#b7c7ea"
  }

  sizes: QtObject {
    property int barSize: 40
  }

  font: QtObject {
    property var family: QtObject {
      property string main: "NotoSans Nerd Font Propo"
      property string monospace: "Jetbrains Mono Nerd Font"
      property string icons: "NotoSans Nerd Font Mono"
    }
    property var pixelSize: QtObject {
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
