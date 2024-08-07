{ pkgs, lib, ...}:
let
  inherit (import ./lib.nix) configuredExtension;
  globalKeybindings = import ./keybindings.nix;

  errorLens = configuredExtension {
    extension = pkgs.vscode-extensions.usernamehw.errorlens;
  };

  scaladex = configuredExtension {
    extension = pkgs.vscode-extensions.baccata.scaladex-search;
  };

  scala = configuredExtension {
    extension = pkgs.vscode-extensions.scala-lang.scala;
   };

  gitlens = configuredExtension {
    extension = pkgs.vscode-extensions.eamodio.gitlens;
    userSettings = {
      "gitlens.worktrees.defaultLocation" = "~/worktrees";
      "gitlens.mode.active" = "review";
      "gitlens.views.worktrees.showBranchComparison" = false;
      "gitlens.views.worktrees.files.layout" = "tree";
      "gitlens.codeLens.scopes" = [
        "document"
        "containers"
        "blocks"
      ];
      "gitlens.hovers.currentLine.over" = "line";
      "gitlens.worktrees.promptForLocation" = false;
      "gitlens.hovers.currentLine.enabled" = false;
      "gitlens.graph.showRemoteNames" = true;
      "gitlens.views.commitDetails.files.layout" = "tree";
    };
  };

  nix-ide = configuredExtension {
    extension = pkgs.vscode-extensions.jnoortheen.nix-ide;
    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nixd.options" = {
        "home-manager" = {
          "expr" = "(builtins.getFlake \"/Users/edmisml/dotfiles\").homeConfigurations.\"edmisml@mbp16\".options";
        };
        "nix-darwin" = {
          "expr" = "(builtins.getFlake \"/Users/edmisml/dotfiles\").darwinConfigurations.\"edmisml\".options";
        };
      };
    };
  };

  indent-rainbow = configuredExtension {
    extension = pkgs.vscode-extensions.oderwat.indent-rainbow;
    userSettings = {
      "indentRainbow.includedLanguages" = [
        "xml"
        "yaml"
      ];
    };
  };
  vscode-vim = configuredExtension {
    extension = pkgs.vscode-extensions.vscodevim.vim;
  };
in
{
  imports = [
    nix-ide
    errorLens
    scaladex
    scala
    gitlens
    indent-rainbow
    vscode-vim
    ./metals.nix
    ./theme.nix
  ];

  programs.vscode = {
    enable = true;
    userSettings = {
      "editor" = {
        fontSize = 15;
        tabSize = 2;
        lineNumbers = "relative";
        fontFamily = "Fira Code";
        fontLigatures = true;
        inlineSuggest.enabled = true;
        minimap.enabled = false;
        cursorBlinking = "solid";
      };
      terminal.integrated.defaultProfile = {
        linux = "fish";
        osx = "fish";
      };
      files = {
        searchExclude = {
          "**/.history" = true;
        };
        autoSave = "afterDelay";
        trimTrailingWhitespace = true;
        insertFinalNewline = true;
      };

    };
    keybindings = globalKeybindings;
  };
}
