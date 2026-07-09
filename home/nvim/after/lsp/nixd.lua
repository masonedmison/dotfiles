local dotfile_loc = os.getenv 'HOME' .. '/dotfiles'

---@type vim.lsp.Config
return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import (builtins.getFlake "' .. dotfile_loc .. '").inputs.nixpkgs { }',
      },
      formatting = {
        command = { 'nixpkgs-fmt' },
      },
      options = {
        home_manager = {
          expr = '(builtins.getFlake "' .. dotfile_loc .. '").homeConfigurations."edmisml@popos".options',
        },
        darwin = {
          expr = '(builtins.getFlake "' .. dotfile_loc .. '").darwinConfigurations.medmison.options',
        },
      },
    },
  },
}
