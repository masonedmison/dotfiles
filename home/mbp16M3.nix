{ pkgs, config, ... }: {
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.lazydocker
  ];

  programs.fish.shellAliases = {
    # mdm git directorys
    mdm = "cd ~/mdm/metadata-manager/";
    mdc = "cd ~/mdm/metadata-common/";
    mdca = "cd ~/mdm/metadata-catalog/";

    # MDM worktrees
    mdmw = "cd ~/mdm/worktrees/";
    mdmwm = "cd ~/mdm/worktrees/mdm";
    mdmwco = "cd ~/mdm/worktrees/mdco";
    mdmwca = "cd ~/mdm/worktrees/mdca";

    drb = "darwin-rebuild switch --flake ~/dotfiles/#medmison";
  };

  # While I'm still new to aerospace I'm going to simply symlink
  # to ~/.config/aerospace for quicker update cycles
  xdg.configFile."aerospace/aerospace.toml" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink /Users/medmison/dotfiles/home/aerospace/aerospace.toml;
  };
}
