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
        'williamboman/mason-lspconfig.nvim',
        event = 'BufReadPost',
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

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      vim.diagnostic.config({ virtual_text = false })

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
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

      local function make_config()
        return { on_attach = on_attach, capabilities = capabilities }
      end

      masonlsp.setup()
      masonlsp.setup_handlers {
        function(server_name)
          lspconfig[server_name].setup { make_config() }
        end,

        ["sumneko_lua"] = function()
          local config = make_config()
          config.settings = {
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

          lspconfig.sumneko_lua.setup(config)
        end,

        ["solargraph"] = function()
          local config = make_config()

          lspconfig.solargraph.setup(config)
        end,

        ["grammarly"] = function()
          local config = make_config()

          lspconfig.grammarly.setup(config)
        end,

        ["tsserver"] = function()
          local config = make_config()

          lspconfig.tsserver.setup(config)
        end,

        ["vue"] = function()
          local config = make_config()

          lspconfig.vue.setup(config)
        end,
      }
    end,
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
