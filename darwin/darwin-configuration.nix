{ pkgs, userConfig, ... }@inputs:
{

  # It seems like this is needed even though I don't use zsh?
  programs.zsh.enable = true;
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "uninstall";

  environment = {
    shells = [ pkgs.fish ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
    variables = { EDITOR = "nvim"; };
  };

  nix = {
    settings.trusted-users = [ userConfig.username ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    package = pkgs.nix;
  };

  system.stateVersion = 4;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    system = userConfig.architecture;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  system.defaults = {
    trackpad.Clicking = true;
    finder.AppleShowAllExtensions = true;
    finder.FXEnableExtensionChangeWarning = false;
    finder._FXShowPosixPathInTitle = true;
    finder.CreateDesktop = false;
    dock.autohide = true;
    dock.orientation = "right";
    dock.show-recents = false;
    dock.tilesize = 40;
    dock.dashboard-in-overlay = true;
    dock.static-only = true;
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.AppleShowAllFiles = true;
    NSGlobalDomain."com.apple.swipescrolldirection" = false;
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
  };
}
