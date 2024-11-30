{ pkgs, config, userConfig, ... }: {
  programs.neovim = {
    enable = true;
  };

  # While I'm still new to neovim I'm going to simply symlink
  # to ~/.config/nvim for quicker update cycles

  xdg.configFile."nvim" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink ../nvim;
  };
}
