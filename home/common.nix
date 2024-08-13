{ pkgs, inputs, stdenv, ... }:

let
  nixGLIntel = inputs.nixGL.packages."${pkgs.system}".nixGLIntel;
in
{
  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "01dkfr9wq3ib5hlyq9zq662mp0jl42fw3f6gd2qgdf8l8ia78j7i";
    })
    ./fonts
    ./programs/vscode
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];


  home = {
    username = "medmison";
    homeDirectory = pkgs.lib.mkForce (
      if pkgs.stdenv.isLinux then "/home/edmisml"
      else "/Users/medmison"
    );
    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "nvim";
    };
    stateVersion = "22.11";

    packages = with pkgs; [
      bottom
      cargo
      coursier
      curl
      duf
      fd
      graphviz
      httpie
      jless
      lazygit
      nixd
      nixpkgs-fmt
      nodejs_22
      obsidian
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
