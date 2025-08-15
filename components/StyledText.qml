import QtQuick
import qs.config

Text {
  readonly property color defaultColor: StyleConfig.colourscheme.white
  renderType: Text.NativeRendering
  verticalAlignment: Text.AlignVCenter
  font {
    hintingPreference: Font.PreferFullHinting
    family: StyleConfig.font.family.main ?? "sans-serif"
    pixelSize: StyleConfig.font.pixelSize.normal ?? 15
  }
  elide: Text.ElideRight
  color: defaultColor
}
