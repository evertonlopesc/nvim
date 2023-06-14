M = {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPost',
    dependencies = {
      {
        'williamboman/mason.nvim',
        event = 'BufReadPost',
        build = ':MasonUpdate',
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
          { '<leader>m', ':Mason<CR>', desc = 'Mason' },
        },
        cmd = 'Mason',
      },
      {
        'williamboman/mason-lspconfig.nvim',
        event = 'BufReadPost',
        opts = {
          ensure_installed = { 'lua_ls', 'solargraph', 'grammarly', 'tsserver' },
          automatic_installation = true,
        },
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

        ['vimls'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.jsonls.setup(config)
        end,

        ['tailwindcss'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.jsonls.setup(config)
        end,

        ['yamlls'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.jsonls.setup(config)
        end,

        ['dockerls'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.jsonls.setup(config)
        end,

        ['jsonls'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.jsonls.setup(config)
        end,

        ['lua_ls'] = function()
          local config = make_config()
          config.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
          lspconfig.lua_ls.setup(config)
        end,

        ['solargraph'] = function()
          local config = make_config()
          lspconfig.solargraph.setup(config)
        end,

        ['tsserver'] = function()
          local config = make_config()
          lspconfig.tsserver.setup(config)
        end,

        ['volar'] = function()
          local config = make_config()
          lspconfig.volar.setup(config)
        end,

        ['grammarly'] = function()
          local config = make_config()
          lspconfig.grammarly.setup(config)
        end,
      })
    end,
    keys = {
      {
        '<space>e',
        vim.diagnostic.open_float,
        desc = 'Lsp diagnostic open float',
      },
      { '[d', vim.diagnostic.goto_prev, desc = 'Lsp diagnostic goto prev' },
      { ']d', vim.diagnostic.goto_next, desc = 'Lsp diagnostic goto next' },
      {
        '<space>q',
        vim.diagnostic.setloclist,
        desc = 'Lsp diagnostic setloclist',
      },
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local nls = require('null-ls')
      local blts = nls.builtins

      nls.setup({
        sources = {
          blts.formatting.stylua.with({
            filetypes = { 'lua' },
          }),
          blts.formatting.erb_lint.with({
            filetypes = { 'erb' },
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
        },
      })
    end,
  },
}

return M
