require 'mason'

local home = os.getenv 'HOME'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local get_package_install_path = function(package_name)
  return vim.fn.expand('$MASON/packages/' .. package_name)
end

local jdtls_path = get_package_install_path 'jdtls'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Xmx2G', -- Increase max heap size to 2GB
    '-Xms100m', -- Initial heap size

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
    '-javaagent:' .. (jdtls_path .. '/lombok.jar'),
    '-jar',
    vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    jdtls_path .. '/config_mac',
    '-data',
    home .. '/.cache/jdtls/workspace' .. project_name,
  },
  root_dir = require('jdtls').setup.find_root { '.git', 'mvnw', 'gradlew' },
  settings = {
    java = {},
  },
  capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
