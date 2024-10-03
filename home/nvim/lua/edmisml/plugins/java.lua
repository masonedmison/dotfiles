return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  config = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local config = {
      -- The command that starts the language server
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      cmd = {
        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar',
        vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                                                        ^^^^^^^^^^^^^^
        -- Must point to the                                                                                      Change this to
        -- eclipse.jdt.ls installation                                                                            the actual version

        -- 💀
        '-configuration',
        vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/config_mac',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                      ^^^^^^
        -- Must point to the                                    Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation                          Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        '-data',
        vim.fn.expand '~/.cache/jdtls/workspace' .. project_name,
      },
      root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
      settings = {
        java = {},
      },
      capabilities = capabilities,
    }
    require('jdtls').start_or_attach(config)
  end,
}
