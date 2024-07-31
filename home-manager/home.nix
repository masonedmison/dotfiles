{ config, pkgs, inputs, ... }:

let 
  system = "x86_64-linux";
  kmonad = inputs.kmonad.packages.${system}.default;
  nixGLIntel = inputs.nixGL.packages."${system}".nixGLIntel;
in
{
  nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";

  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
      sha256 = "0g5yk54766vrmxz26l3j9qnkjifjis3z2izgpsfnczhw243dmxz9";
    })
    ./fonts
    ./programs/git.nix
    ./programs/firefox.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/starship.nix
  ];


  home = {

    username = "edmisml";
    homeDirectory = "/home/edmisml";
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
      fish
      gdb
      graphviz
      httpie
      jless
      kmonad
      nil
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
