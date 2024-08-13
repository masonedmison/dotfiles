{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = "shell fish";
    theme = "Space Gray Eighties";
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
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false,*";
      # disable blinky cursor
      cursor_blink_interval = 0;
    };
    keybindings = {
      "ctrl+shift+alt+l" = "next_layout";
      # window shortcuts
      "ctrl+shift+alt+n" = "new_window";
      "ctrl+shift+alt+k" = "next_window";
      "ctrl+shift+alt+j" = "previous_window";
      "ctrl+shift+alt+w" = "close_window";
      "ctrl+shift+alt+r" = "start_resizing_window";

      # tab shortcuts
      "ctrl+shift+alt+t" = "new_tab";
      "ctrl+shift+alt+q" = "close_tab";
    };
  };
}
