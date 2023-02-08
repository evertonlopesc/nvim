local M = {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      {
        'williamboman/mason.nvim',
        event = 'BufReadPost',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
        config = true,
        keys = {
          { '<leader>m', ':Mason<cr>', desc = 'Mason' },
        },
        cmd = 'Mason',
      },
      {
        'williamboman/mason-lspconfig.nvim',
        event = 'BufReadPost',
        opts = { automatic_installation = true },
        config = true,
      },
    },
    config = function()
      require('mason').setup()
      local masonlsp = require('mason-lspconfig')
      local lspconfig = require('lspconfig')

      vim.diagnostic.config({ virtual_text = false })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local handlers = require('plugins.lsp.handlers')
      local on_attach = function(_, bufnr)
        require('plugins.lsp.actions').on_attach(_, bufnr)
      end

      local function make_config()
        return {
          on_attach = on_attach,
          capabilities = capabilities,
          handlers = handlers,
        }
      end

      masonlsp.setup()
      masonlsp.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({ make_config() })
        end,

        ['sumneko_lua'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.sumneko_lua.setup(config)
        end,

        ['solargraph'] = function()
          local config = make_config()
          lspconfig.solargraph.setup(config)
        end,

        ['tsserver'] = function()
          local config = make_config()
          lspconfig.tsserver.setup(config)
        end,

        ['vuels'] = function()
          local config = make_config()
          lspconfig.vuels.setup(config)
        end,
      })
    end,
    keys = {
      { '<space>e', vim.diagnostic.open_float },
      { '[d', vim.diagnostic.goto_prev },
      { ']d', vim.diagnostic.goto_next },
      { '<space>q', vim.diagnostic.setloclist },
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPost',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local nls = require('null-ls')
      local blts = nls.builtins

      nls.setup({
        sources = {
          blts.formatting.erb_lint.with({
            filetypes = { 'erb' },
          }),
          blts.formatting.rubocop.with({
            filetypes = { 'rb' },
          }),
          blts.formatting.stylua.with({
            filetypes = { 'lua' },
          }),
          blts.formatting.prettierd.with({
            filetypes = {
              'css',
              'html',
              'javascript',
              'javascriptreact',
              'json',
              'jsonc',
              'less',
              'typescript',
              'typescriptreact',
              'scss',
              'vue',
              'yaml',
            },
          }),
          blts.formatting.markdownlint.with({
            filetypes = { 'markdown' },
          }),
          blts.code_actions.gitsigns,
          blts.code_actions.eslint_d.with({
            filetypes = {
              'javascript',
              'javascriptreact',
              'typescript',
              'typescriptreact',
              'vue',
            },
          }),
        },
      })
    end,
  },
}

return M
