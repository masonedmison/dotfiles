{ pkgs, ... }: {
  imports = [
    ./programs/firefox.nix
    ./common.nix
  ];

  home.packages = with pkgs; [
    discord
    gdb
    jetbrains.idea-community
    kmonad
    spotify
  ];

  home.file.".config/kmonad" = {
    source = ./kmonad/config.kbd;
  };

  programs.fish.shellAliases = {
    hms = "home-manager switch --flake ~/dotfiles/#edmisml@popos";
  };
}

