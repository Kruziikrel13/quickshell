inputs:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib.options) mkOption mkPackageOption mkEnableOption;
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;
  inherit (pkgs.stdenv.hostPlatform) system;
  inherit (inputs) self qtengine;

  cfg = config.programs.quickshell;
in
{
  imports = [ qtengine.nixosModules.default ];
  options.programs.quickshell = with lib.types; {
    enable = mkEnableOption "quickshell";
    debug = mkEnableOption "quickshell built in debug mode";
    package = mkPackageOption self.packages.${system} "quickshell" { nullable = false; };
    systemd = {
      enable = mkEnableOption "auto startup with systemd";
      target = mkOption {
        type = str;
        default = "graphical-session.target";
        example = "hyprland-session.target";
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
      pkgs.kdePackages.breeze
      pkgs.kdePackages.breeze.qt5
      pkgs.kdePackages.breeze-icons
    ];

    programs.qtengine = {
      enable = true;
      config = {
        theme = {
          colorScheme = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
          iconTheme = "breeze-dark";
          style = "breeze";

          font = {
            family = "NotoSans Nerd Font Propo";
            size = 13;
            weight = -1;
          };

          fontFixed = {
            family = "NotoSans Nerd Font Mono";
            size = 13;
            weight = -1;
          };
        };

        misc = {
          singleClickActivate = false;
          menusHaveIcons = true;
          shortcutsForContextMenus = true;
        };
      };
    };

    systemd.user.services.quickshell = mkIf cfg.systemd.enable {
      unitConfig = {
        Description = "Quickshell Desktop Shell System";
        Documentation = "https://quickshell.org";
        PartOf = [
          cfg.systemd.target
          "tray.target"
        ];
        After = [ cfg.systemd.target ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      serviceConfig = {
        ExecStop = "${getExe cfg.package} kill";
        ExecStart = "${getExe cfg.package}";
        Restart = "always";
        KillMode = "mixed";
      };

      wantedBy = [
        cfg.systemd.target
        "tray.target"
      ];
    };
  };
}
