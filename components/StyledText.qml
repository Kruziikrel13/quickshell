import QtQuick
import qs.config

Text {
  id: root
  readonly property color defaultColor: StyleConfig.colourscheme.white
  property alias bold: root.font.bold
  color: defaultColor
  renderType: Text.NativeRendering
  verticalAlignment: Text.AlignVCenter
  font {
    hintingPreference: Font.PreferFullHinting
    family: StyleConfig.font.family.main ?? "sans-serif"
    pixelSize: StyleConfig.font.pixelSize.normal ?? 15
  }
  elide: Text.ElideRight
}
