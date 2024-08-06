{ pkgs, ... }: {
  home.packages = [
    pkgs.fira-code
  ];
  fonts.fontconfig.enable = true;
}
