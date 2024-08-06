{ pkgs, inputs, stdenv, ... }:

let
  nixGLIntel = inputs.nixGL.packages."${pkgs.system}".nixGLIntel;
in
{
  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "0g5yk54766vrmxz26l3j9qnkjifjis3z2izgpsfnczhw243dmxz9";
    })
    ./fonts
    ./programs/vscode
    ./programs/git.nix
    ./programs/firefox.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];


  home = {

    username = "edmisml";
    homeDirectory =
      if pkgs.stdenv.isLinux then "/home/edmisml"
      else "/Users/edmisml";
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
      discord
      duf
      fd
      # gdb
      graphviz
      httpie
      jless
      # kmonad
      nixd
      nixpkgs-fmt
      obsidian
      p7zip
      pstree
      python3
      ranger
      ripgrep
      spotify
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
    fish = {
      enable = true;
      shellInit = ''
        starship init fish | source
        set -gx'';
      shellAliases = {
        g = "git";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
