{
  pkgs ? import <nixpkgs> { },
  quickshell ? pkgs.callPackage ./package.nix { },
}:
pkgs.mkShellNoCC {
  inputsFrom = [ quickshell ];

  packages = [
    pkgs.qt6.qtdeclarative
    pkgs.nixfmt
  ];
}
