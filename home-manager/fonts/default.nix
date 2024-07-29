{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.fira-code
  ];
}