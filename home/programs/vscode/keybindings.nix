[
  {
    "key" = "ctrl+shift+alt+b";
    "command" = "workbench.action.navigateBack";
  }
  {
    "key" = "ctrl+alt+-";
    "command" = "-workbench.action.navigateBack";
  }
  {
    "key" = "ctrl+shift+alt+d";
    "command" = "editor.action.revealDefinition";
    "when" = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor";
  }
  {
    "key" = "f12";
    "command" = "-editor.action.revealDefinition";
    "when" = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor";
  }
  {
    "key" = "ctrl+shift+alt+f";
    "command" = "workbench.action.quickOpen";
  }
  {
    "key" = "ctrl+e";
    "command" = "-workbench.action.quickOpen";
  }
  {
    "key" = "ctrl+shift+alt+s";
    "command" = "metals.symbol-search";
    "when" = "editorLangId == 'java' || editorLangId == 'sbt' || editorLangId == 'sc' || editorLangId == 'scala'";
  }
  {
    "key" = "ctrl+t";
    "command" = "-metals.symbol-search";
    "when" = "editorLangId == 'java' || editorLangId == 'sbt' || editorLangId == 'sc' || editorLangId == 'scala'";
  }
  {
    "key" = "ctrl+s r";
    "command" = "workbench.action.splitEditorRight";
  }
  {
    "key" = "ctrl+k ctrl+\\";
    "command" = "-workbench.action.splitEditorRight";
  }
  {
    "key" = "ctrl+s u";
    "command" = "workbench.action.splitEditorUp";
  }
  {
    "key" = "ctrl+k ctrl+\\";
    "command" = "-workbench.action.splitEditorUp";
  }
  {
    "key" = "ctrl+shift+alt+n";
    "command" = "workbench.action.navigateForward";
    "when" = "canNavigateForward";
  }
  {
    "key" = "ctrl+shift+-";
    "command" = "-workbench.action.navigateForward";
    "when" = "canNavigateForward";
  }
  {
    "key" = "ctrl+p m";
    "command" = "workbench.action.toggleMaximizedPanel";
  }
  {
    "key" = "ctrl+s c";
    "command" = "workbench.action.editorLayoutSingle";
  }
  {
    "key" = "ctrl+shift+alt+l";
    "command" = "gitlens.views.graph.focus";
  }
  {
    "key" = "ctrl+shift+alt+w";
    "command" = "gitlens.gitCommands.worktree";
  }
  {
    "key" = "ctrl+shift+alt+h";
    "command" = "workbench.action.toggleSidebarVisibility";
  }
  {
    "key" = "ctrl+b";
    "command" = "-workbench.action.toggleSidebarVisibility";
  }
  {
    "key" = "ctrl+shift+alt+p";
    "command" = "editor.action.marker.next";
    "when" = "editorFocus";
  }
  {
    "key" = "alt+f8";
    "command" = "-editor.action.marker.next";
    "when" = "editorFocus";
  }
  {
    "key" = "ctrl+shift+alt+t";
    "command" = "workbench.action.terminal.toggleTerminal";
    "when" = "terminal.active";
  }
  {
    "key" = "ctrl+`";
    "command" = "-workbench.action.terminal.toggleTerminal";
    "when" = "terminal.active";
  }
  {
    "key" = "ctrl+shift+alt+v";
    "command" = "workbench.view.scm";
    "when" = "workbench.scm.active && !gitlens= disabled && config.gitlens.keymap == 'chorded'";
  }
  {
    "key" = "ctrl+shift+g g";
    "command" = "-workbench.view.scm";
    "when" = "workbench.scm.active && !gitlens= disabled && config.gitlens.keymap == 'chorded'";
  }
  {
    "key" = "ctrl+shift+alt+c";
    "command" = "workbench.action.showCommands";
  }
  {
    "key" = "ctrl+shift+alt+v";
    "command" = "workbench.view.scm";
    "when" = "workbench.scm.active";
  }
  {
    "key" = "ctrl+shift+g";
    "command" = "-workbench.view.scm";
    "when" = "workbench.scm.active";
  }
  {
    "key" = "shift+k";
    "command" = "workbench.action.nextEditorInGroup";
    "when" = "vim.active && vim.mode != 'Insert'";
  }
  {
    "key" = "ctrl+k ctrl+pagedown";
    "command" = "-workbench.action.nextEditorInGroup";
  }
  {
    "key" = "shift+j";
    "command" = "workbench.action.previousEditorInGroup";
    "when" = "vim.active && vim.mode != 'Insert'";
  }
  {
    "key" = "ctrl+k ctrl+pageup";
    "command" = "-workbench.action.previousEditorInGroup";
  }
  {
    "key" = "ctrl+k ctrl+pageup";
    "command" = "-workbench.action.previousEditorInGroup";
  }
  {
    "key" = "ctrl+shift+alt+e";
    "command" = "workbench.view.explorer";
  }
  {
    "key" = "shift+alt+e";
    "command" = "-workbench.view.explorer";
  }
  {
    "key" = "ctrl+k w";
    "command" = "workbench.action.closeEditorsInGroup";
  }
  {
    "key" = "alt+k w";
    "command" = "-workbench.action.closeEditorsInGroup";
  }
  {
    "key" = "ctrl+shift+alt+m f";
    "command" = "workbench.action.findInFiles";
  }
  {
    "key" = "shift+alt+f";
    "command" = "-workbench.action.findInFiles";
  }
  {
    "key" = "ctrl+shift+alt+m h";
    "command" = "workbench.action.replaceInFiles";
  }
  {
    "key" = "shift+alt+f";
    "command" = "-workbench.action.replaceInFiles";
  }
  {
    "key" = "ctrl+f";
    "command" = "actions.find";
    "when" = "editorFocus || editorIsOpen";
  }
  {
    "key" = "cmd+f";
    "command" = "-actions.find";
    "when" = "editorFocus || editorIsOpen";
  }
  {
    "key" = "ctrl+h";
    "command" = "editor.action.startFindReplaceAction";
    "when" = "editorFocus || editorIsOpen";
  }
  {
    "key" = "alt+cmd+f";
    "command" = "-editor.action.startFindReplaceAction";
    "when" = "editorFocus || editorIsOpen";
  }
  {
    "key" = "ctrl+shift+alt+q";
    "command" = "editor.action.formatDocument";
    "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
  }
  {
    "key" = "shift+alt+f";
    "command" = "-editor.action.formatDocument";
    "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
  }
]
