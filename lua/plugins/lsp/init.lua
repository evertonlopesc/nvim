M = {
  {
    'williamboman/mason.nvim',
    event = 'BufReadPost',
    build = ':MasonUpdate',
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = {
            'lua_ls', 'solargraph', 'grammarly', 'tsserver', 'rust-analyzer'
          },
          automatic_installation = true,
        },
        config = function()
          require("mason").setup()
          require("mason-lspconfig")
          local lspconfig = require("lspconfig")

          vim.diagnostic.config({ virtual_text = false })

          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local handlers     = require('plugins.lsp.handlers')
          local on_attach    = function(_, bufnr)
            require('plugins.lsp.actions').on_attach(_, bufnr)
          end

          lspconfig.lua_ls.setup {
            lua = { diagnostics = { globals = { 'vim' } } },
            on_attach = on_attach, capabilities = capabilities, handlers =
              handlers,
          }
          lspconfig.rust_analyzer.setup {
            on_attach = on_attach, capabilities = capabilities, handlers =
              handlers,
          }
          lspconfig.solargraph.setup {
            on_attach = on_attach, capabilities = capabilities, handlers =
              handlers,
          }
          lspconfig.grammarly.setup {
            on_attach = on_attach, capabilities = capabilities, handlers =
              handlers,
          }
          lspconfig.tsserver.setup {
            on_attach = on_attach, capabilities = capabilities, handlers =
              handlers,
          }
        end,
      },
      {
        "neovim/nvim-lspconfig",
      }
    },
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
      { '<leader>m', ':Mason<CR>',             desc = 'Mason' },
      {
        '<space>e',
        vim.diagnostic.open_float,
        desc = 'Lsp diagnostic open float',
      },
      { '[d',        vim.diagnostic.goto_prev, desc = 'Lsp diagnostic goto prev' },
      { ']d',        vim.diagnostic.goto_next, desc = 'Lsp diagnostic goto next' },
      {
        '<space>q',
        vim.diagnostic.setloclist,
        desc = 'Lsp diagnostic setloclist',
      },
    },
    cmd = 'Mason',
  },
}

return M
