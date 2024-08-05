{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Space Gray Eighties";
    extraConfig = "shell fish";
    font = {
      name = "JetBrains Mono";
      size =
        if pkgs.stdenv.isDarwin then 15
        else 11;
      package = pkgs.jetbrains-mono;
    };
    package =
      # It seems we only need to wrap kitty in nixGL
      # for my popos system at the moment
      if pkgs.stdenv.isLinux then
        (config.lib.nixGL.wrap pkgs.kitty)
      else pkgs.kitty;
    settings = {
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
    };
  };
}
