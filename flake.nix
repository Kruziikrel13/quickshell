{
  description = "Custom Quickshell Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";
    qtengine.url = "github:kossLAN/qtengine";
    qtengine.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      quickshell,
      qtengine,
    }:
    let
      inherit (nixpkgs) lib;
      overlayPkgs =
        p:
        p.appendOverlays [
          quickshell.overlays.default
        ];
      systems = lib.platforms.linux;
      forEachSystem =
        fn: lib.genAttrs systems (system: fn system (overlayPkgs nixpkgs.legacyPackages.${system}));
    in
    {
      packages = forEachSystem (
        system: pkgs: rec {
          inherit (pkgs) quickshell;
          default = quickshell;
        }
      );

      devShells = forEachSystem (
        system: pkgs: {
          default = import ./nix/shell.nix {
            inherit pkgs;
            inherit (self.packages.${system}) quickshell;
          };
        }
      );
    };
}
