{
  pkgs,
  ...
}:

{
  packages = [ pkgs.qt6.qtdeclarative ];

  processes.quickshell.exec = "quickshell";
}
