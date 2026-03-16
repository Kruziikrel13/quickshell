{
  description = "Custom Quickshell Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
    qs.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    qs.inputs.nixpkgs.follows = "nixpkgs";
    qtengine.url = "github:kossLAN/qtengine";
    qtengine.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      qs,
      qtengine,
    }:
    let
      inherit (nixpkgs) lib;
      systems = lib.platforms.linux;
      forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forEachSystem (
        system: pkgs: rec {
          quickshell = pkgs.callPackage ./nix/package.nix { quickshell = qs.packages.${system}.default; };
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
