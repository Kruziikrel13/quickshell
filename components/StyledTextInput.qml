import QtQuick
import qs.common

TextInput {
  id: root
  readonly property color defaultColor: Colours.colourscheme.white
  property alias bold: root.font.bold
  color: root.defaultColor
  renderType: TextInput.NativeRendering
  verticalAlignment: TextInput.AlignVCenter
  font {
    hintingPreference: Font.PreferFullHinting
    family: Colours.font.family.main ?? "sans-serif"
    pixelSize: Colours.font.pixelSize.normal ?? 15
  }
}
