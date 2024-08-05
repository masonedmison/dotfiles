let
  mkFormatModule = { vscodeExtUniqueId, lang }:
    let toEntry = lang: {
      name = "[${lang}]";
      value = { "editor.defaultFormatter" = vscodeExtUniqueId; };
    };
    in
      builtins.listToAttrs(
        builtins.map toEntry lang
      );

  mkVscodeModule = content: { programs.vscode = content; };
  configuredExtension = { extension,  userSettings ? { }, keybindings ? [ ], formatterFor ? [ ] }:
    let
      formatModule = {
        userSettings =
          mkFormatModule {
            inherit (extension) vscodeExtUniqueId;
            lang = formatterFor;
          };
      };

      extModule = {
        inherit userSettings keybindings;
        extensions = [ extension ];
    };
    in
      { imports = builtins.map mkVscodeModule [ extModule formatModule ]; };
in
  {inherit configuredExtension mkVscodeModule ; }