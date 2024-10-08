{ config, ... }: {
  imports = [ ./common.nix ];

  # While I'm still new to aerospace I'm going to simply symlink
  # to ~/.config/aerospace for quicker update cycles
  xdg.configFile."aerospace/aerospace.toml" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink /Users/edmisml/dotfiles/home/aerospace/aerospace.toml;
  };
}
