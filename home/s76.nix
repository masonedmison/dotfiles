{ pkgs, ... }: {
  imports = [
    ./programs/firefox.nix
    ./common.nix
  ];

  home.packages = with pkgs; [
    discord
    gdb
    kmonad
    spotify
  ];

  home.file.".config/kmonad" = {
    source = ./kmonad/config.kbd;
  };
}

