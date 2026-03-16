{
  quickshell,
  qt6,
  kdePackages,
  debug ? false,
}:
quickshell.withModules [
  qt6.qtimageformats
  qt6.qtmultimedia
  kdePackages.qtsvg
]
