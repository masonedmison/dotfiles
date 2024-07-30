{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Space Gray Eighties";
    extraConfig = "shell fish";
    font = {
      name = "JetBrains Mono";
      size = 11;
      package = pkgs.jetbrains-mono; 
    };
    package = (config.lib.nixGL.wrap pkgs.kitty);
  };
}