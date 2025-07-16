import QtQuick
import qs

Text {
  readonly property color defaultColor: ShellGlobals.colors.fontPrimary
  renderType: Text.NativeRendering
  font.hintingPreference: Font.PreferFullHinting
  font.family: ShellGlobals.font.family.main
  font.pixelSize: ShellGlobals.sizes.font.normal
  color: defaultColor
}
