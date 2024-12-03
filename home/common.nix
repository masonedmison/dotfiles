{ pkgs, inputs, userConfig, stdenv, ... }:

{

  imports = [
    ./fonts
    ./programs/vscode
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];

  nixGL = {
    packages = inputs.nixgl.packages;
    defaultWrapper = "mesa";
  };

  home = {
    username = userConfig.username;
    homeDirectory = pkgs.lib.mkForce (
      userConfig.userDir
    );
    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "nvim";
      VAULT_PATH = userConfig.obsidian.vaultPath;
      VAULT_NAME = userConfig.obsidian.vaultName;
      FISH_PATH = userConfig.fishPath;
    };
    stateVersion = "22.11";

    # symlink .editorconfig file to home
    file.".editorconfig" = {
      source = ./.editorconfig;
    };
    packages = with pkgs; [
      bottom
      coursier
      curl
      duf
      fd
      graphviz
      httpie
      jless
      lazygit
      lua
      nixd
      nixpkgs-fmt
      nodejs_22
      obsidian
      p7zip
      pstree
      python3
      ranger
      ripgrep
      rustup
      tldr
      tokei
      tree
      wget
      xclip
      yarn
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
      shellAliases = {
        g = "git";
        dt = "cd ~/dotfiles; nvim";
        lzd = "lazydocker";
        lzg = "lazygit";
      };
      functions = {
        envsource = {
          body = ''
            for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
              set item (string split -m 1 '=' $line)
              set -gx $item[1] $item[2]
              echo "Exported key $item[1]"
            end
          '';
        };
        cdnv = {
          body = "cd $argv; nvim .";
        };
      };
    };
    less.enable = true;
    fzf.enable = true;
    htop.enable = true;
    jq.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
