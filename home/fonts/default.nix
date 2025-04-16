{ pkgs, lib, ... }: {
  home.packages = [
    pkgs.fira-code
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  fonts.fontconfig.enable = true;
}
