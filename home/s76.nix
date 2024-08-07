{ pkgs, ... }: {
  imports = [
      ./programs/firefox.nix
      ./common.nix
    ];

  packages = with pkgs; [
    discord
    gdb
    kmonad
    spotify
  ];
}
