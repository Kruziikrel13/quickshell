//@ pragma UseQApplication
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic

// Adjust this to make the shell smaller or larger
//@ pragma Env QT_SCALE_FACTOR=1

import "./windows/Bar"
import "./windows/MediaControls/"
import "./windows/PowerMenu"
import "./windows/OnScreenDisplay"
import Quickshell

Scope {
  Bar {}
  // OnScreenDisplayVolume {}
  // MediaControls {}
  PowerMenu {}
}
