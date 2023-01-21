local vim = vim

local M = {
  {
    'williamboman/mason.nvim',
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
      { '<leader>m', ':Mason<CR>' },
    },
    cmd = 'Mason',
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'sumneko_lua',
      },
      automactic_installation = true,
    },
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    opts = {
      servers = {
        sumneko_lua = {
          settings = {
            lua = {
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
            },
          },
        },
        solargraph = {
          init_options = {
            formatting = false,
          },
        },
      },
    },
    config = function()
      local lspc = require('lspconfig')
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set

      local border = {
        { '1', 'FloatBorder' },
        { '', 'FloatBorder' },
        { '2', 'FloatBorder' },
        { '⏽', 'FloatBorder' },
        { '3', 'FloatBorder' },
        { '', 'FloatBorder' },
        { '4', 'FloatBorder' },
        { '⏽', 'FloatBorder' },
      }

      local handlers = {
        ['textDocument/hover'] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = border }
        ),
        ['textDocument/signatureHelp'] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          { border = border }
        ),
      }

      vim.diagnostic.config({ virtual_text = false })

      keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
      keymap('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap('n', ']d', vim.diagnostic.goto_next, opts)
      keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        keymap('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
        keymap('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
        keymap('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
        keymap('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
        keymap('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
        keymap('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
        keymap('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
        keymap('n', '<leader>le', vim.lsp.buf.references, bufopts)
        keymap('n', '<leader>lf', function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local signs =
        { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local servers = require('mason-lspconfig').get_installed_servers()
      for _, server in ipairs(servers) do
        lspc[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          handlers = handlers,
        })
      end
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
