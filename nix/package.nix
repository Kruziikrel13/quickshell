{
  quickshell,
  kdePackages,

  debug ? false,
  extraPackages ? [ ],
}:
quickshell.override { inherit debug; }.withModules [
  kdePackages.breeze
  kdePackages.breeze.qt5
  kdePackages.breeze-icons
]
++ extraPackages
