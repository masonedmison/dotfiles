{ pkgs, inputs, userConfig, config, ... }:

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
    file = {
      ".editorconfig" = {
        source = ./.editorconfig;
      };
      ".ideavimrc" = {
        source = config.lib.file.mkOutOfStoreSymlink ./intellij/.ideavimrc;
      };
    };

    packages = with pkgs; [
      bottom
      coursier
      curl
      delta
      duf
      fd
      graphviz
      httpie
      jless
      lazydocker
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
      yq
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
    lazygit = {
      enable = true;
      settings = {
        gui = {
          showFileIcons = true;
          sidePanelWidth = 0.25;
          nerdFontsVersion = "3";
        };
        git.paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never --side-by-side --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
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
