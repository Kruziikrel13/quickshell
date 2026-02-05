{
  pkgs ? import <nixpkgs> { },
  quickshell ? pkgs.callPackage ./package.nix { },
}:
pkgs.mkShell {
  inputsFrom = [ quickshell ];
  packages = [ pkgs.qt6.qtdeclarative ];

  shellHook = ''
    touch .qmlls.ini
  '';
}
