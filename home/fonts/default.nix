{ pkgs, ... }: {
  home.packages = [
    pkgs.fira-code
    pkgs.nerdfonts
  ];

  fonts.fontconfig.enable = true;
}
