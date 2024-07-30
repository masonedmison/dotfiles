{ pkgs, kmonad, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "edmisml";
    homeDirectory = "/home/edmisml";
    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "nvim";
    };
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.11";

    packages = with pkgs; [
      bottom
      cargo
      chicken
      # clang
      curl
      duf
      exa
      fd
      fish
      fx
      gdb
      graphviz
      httpie
      jless
      kmonad
      # llvm
      nil
      p7zip
      pstree
      python3
      ranger
      ripgrep
      tldr
      tokei
      tree
      wget
      xclip
    ];
  };

  programs = {
    bat = {
      enable = true;
      config.theme = "ansi";
    };
    fish = {
      enable = true;
      shellInit = ''
        starship init fish | source
        set -gx'';
    };
    less.enable = true;
    fzf.enable = true;
    htop.enable = true;
    jq.enable = true;
  };

  xdg.configFile = {"foo" = { text = '' your config here ''; };};

  imports = [
    ./fonts
    ./programs/git.nix
    ./programs/firefox
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  xdg = {
    enable = true;
  };
}
