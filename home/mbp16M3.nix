{ pkgs, config, ... }: {
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.lazydocker
  ];

  # While I'm still new to aerospace I'm going to simply symlink
  # to ~/.config/aerospace for quicker update cycles
  xdg.configFile."aerospace/aerospace.toml" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink /Users/medmison/dotfiles/home/aerospace/aerospace.toml;
  };
}
