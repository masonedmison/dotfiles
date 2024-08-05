# Stolen from https://github.com/kubukoz/nix-config/blob/main/vscode/metals.nix
{ pkgs, ... }:
let
  inherit (import ./lib.nix) configuredExtension;
  inherit (pkgs) vscode-extensions;
in
configuredExtension {
  extension = vscode-extensions.scalameta.metals;
  formatterFor = [ "scala" ];
  userSettings = {
    "metals.serverProperties" = [
      "-Dmetals.verbose=true"
      "-Xmx4g"
      "-Xss10m"
      "-XX:+CrashOnOutOfMemoryError"
    ];
    "metals.superMethodLensesEnabled" = false;
    "metals.enableSemanticHighlighting" = false;
    "files.watcherExclude" = {
      "**/.ammonite" = true;
      "**/.bloop" = true;
      "**/.metals" = true;
    };
  };
  keybindings = [
    {
      key = "ctrl+shift+alt+m i";
      command = "metals.build-import";
    }
    {
      key = "ctrl+shift+alt+m s";
      command = "metals.goto-super-method";
    }
  ];
}
