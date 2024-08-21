local map = vim.keymap.set

return {
  'scalameta/nvim-metals',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    {
      'mfussenegger/nvim-dap',
      config = function(self, opts)
        -- Debug settings if you're using nvim-dap
        local dap = require 'dap'

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })

        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'dap-repl',
          callback = function()
            require('dap.ext.autocompl').attach()
          end,
        })

        vim.api.nvim_create_user_command('DebugStop', function()
          dap.terminate()
        end, {})

        dap.configurations.scala = {
          {
            type = 'scala',
            request = 'launch',
            name = 'RunOrTest',
            metals = {
              runType = 'runOrTestFile',
              --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
            },
          },
          {
            type = 'scala',
            request = 'launch',
            name = 'Test Target',
            metals = {
              runType = 'testTarget',
            },
          },
        }
      end,
    },
  },
  ft = { 'scala', 'sbt', 'java' },
  opts = function()
    local metals_config = require('metals').bare_config()

    -- Example of settings
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
      -- testUserInterface = 'Test Explorer',
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to either "off" or "on"
    --
    -- "off" will enable LSP progress notifications by Metals and you'll need
    -- to ensure you have a plugin like fidget.nvim installed to handle them.
    --
    -- "on" will enable the custom Metals status extension and you *have* to have
    -- a have settings to capture this in your statusline or else you'll not see
    -- any messages from metals. There is more info in the help docs about this
    metals_config.init_options.statusBarProvider = 'off'

    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      require('metals').setup_dap()

      -- LSP mappings
      map({ 'n', 'v' }, 'K', vim.lsp.buf.hover)
      map('n', '<leader>cl', vim.lsp.codelens.run, { desc = '[C]ode [L]ens' })
      map('n', '<leader>csh', vim.lsp.buf.signature_help, { desc = '[C]ode [S]ignature [H]elp' })
      map('n', '<leader>bf', vim.lsp.buf.format, { desc = '[B]uffer [F]ormat' })
      map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
      map('n', 'gS', require('metals').goto_super_method, { desc = '[G]oto [S]uper method' })

      map('n', '<leader>ws', function()
        require('metals').hover_worksheet()
      end)

      -- Dap mappings

      map('n', '<leader>dc', function()
        require('dap').continue()
      end, { desc = '[D]ebug [C]ontinue' })

      map('n', '<leader>dr', function()
        require('dap').repl.toggle()
      end, { desc = '[D]ebug [R]epl toggle' })

      map('n', '<leader>dK', function()
        require('dap.ui.widgets').hover()
      end, { desc = '[D]ebug Hover [K]' })

      map('n', '<leader>dt', function()
        require('dap').toggle_breakpoint()
      end, { desc = '[D]ebug [T]oggle Breakpoint' })

      map('n', '<leader>deo', function()
        require('dap').step_over()
      end, { desc = '[D]ebug [E]xecute [O]ver' })

      map('n', '<leader>dei', function()
        require('dap').step_into()
      end, { desc = '[D]ebug [E]xecute [I]nto' })

      map('n', '<leader>deu', function()
        require('dap').step_into()
      end, { desc = '[D]ebug [E]xecute o[U]t' })

      map('n', '<leader>dl', function()
        require('dap').run_last()
      end, { desc = '[D]ebug Run [L]ast' })

      map('n', '<leader>db', function()
        require('dap').list_breakpoints(true)
      end, { desc = '[D]ebug [B]reakpoints' })

      map({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end, { desc = '[D]ebug [P]review' })

      map('n', '<Leader>df', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.frames)
      end, { desc = '[D]ebug [F]rames' })

      map('n', '<Leader>dS', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = '[D]ebug [S]copes' })
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = self.ft,
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
