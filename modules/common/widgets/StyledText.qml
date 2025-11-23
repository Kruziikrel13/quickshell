import QtQuick

import qs.modules.common

Text {
  id: root
  renderType: Text.NativeRendering
  verticalAlignment: Text.AlignVCenter
  property alias bold: root.font.bold
  color: Appearance.colours.on_background
  font {
    hintingPreference: Font.PreferDefaultHinting
    family: Appearance.font.family.main ?? "sans-serif"
    pixelSize: Appearance.font.pixelSize.normal
  }
  elide: Text.ElideRight
}
