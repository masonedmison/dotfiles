{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "edmisml";
    homeDirectory = "/home/edmisml";
    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "vim";
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
      clang
      curl
      docker
      docker-compose
      duf
      exa
      fd
      fish
      fx
      gdb
      httpie
      jless
      llvm
      pstree
      python3
      ranger
      ripgrep
      tldr
      tokei
      tree
      wget
    ];
  };

  programs = {
    bat = {
      enable = true;
      config.theme = "ansi";
    };
    starship = {
      enable = true;
      # Configuration written to ~/.config/starship.toml
      settings = {
        # add_newline = false;

        c = {};

        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };

        directory = {
          truncation_length = 6;
          truncation_symbol = ".../";
        };

        git_branch = {};

        git_commit = {};

        rust = {}; 
        
        scala = {};

        # package.disabled = true;
      };
    };
    less.enable = true;
    fzf.enable = true;
    htop.enable = true;
    jq.enable = true;
  };

  imports = [
    ./programs/git.nix
    ./programs/neovim.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
