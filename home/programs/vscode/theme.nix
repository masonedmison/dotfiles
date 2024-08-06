{ pkgs, lib, ...}:
let
  inherit (import ./lib.nix) configuredExtension;
in
  configuredExtension {
    extension = pkgs.vscode-extensions.zhuangtongfa.material-theme;
    userSettings =
    let
      themeName = "One Dark Pro";
      # These have been stolen from https://github.com/joshdick/onedark.vim
      yellow = "#e5c07b";
      blue = "#61afef";
      light-grey = "#abb2bf";
    in
    {
      "workbench.colorTheme" = themeName;
      "oneDarkPro.italic" = false;
      "editor.tokenColorCustomizations"."[${themeName}]" =
        {
          functions = yellow;
          variables = blue;
          types = blue;
        };
  };
}
