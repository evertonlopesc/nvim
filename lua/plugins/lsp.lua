local M = {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
          ui = {
              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              },
          },
        },
        config = true,
        keys = {
          { '<leader>m', ':Mason<cr>', desc = 'Mason' }
        },
        cmd = 'Mason',
      },

      {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
          ensure_installed = {
            "sumneko_lua", "solargraph", 'tsserver',
          },
        },
        config = true,
      },
    },
    config = function()
      require("mason").setup()
      local masonlsp = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      vim.diagnostic.config({ virtual_text = false })

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', '<leader>lc', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>ltd', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      masonlsp.setup()
      masonlsp.setup_handlers {
        function (server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        ["sumneko_lua"] = function ()
            lspconfig.sumneko_lua.setup {
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                  },
                  telemetry = {
                    enable = false,
                  },
                }
              }
            }
        end,
      }
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local nls = require('null-ls')
      local blts = nls.builtins

      nls.setup({
        sources = {
          blts.formatting.erb_lint,
          blts.formatting.rubocop,
          blts.formatting.stylua,
          blts.formatting.prettierd,
          blts.formatting.markdownlint,

          blts.code_actions.gitsigns,
          blts.code_actions.eslint_d,
        },
      })
    end,
  },
}

return M
