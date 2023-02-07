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
        opts = {
          ensure_installed = {
            'sumneko_lua',
            'solargraph',
            'tsserver',
            'vuels',
            'marksman',
            'html',
          },
        },
        config = true,
      },
    },
    config = function()
      require('mason').setup()
      local masonlsp = require('mason-lspconfig')
      local lspconfig = require('lspconfig')

      local signs =
      { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local border = {
        { '╭', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╮', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '╯', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╰', 'FloatBorder' },
        { '│', 'FloatBorder' },
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

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

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
        vim.keymap.set('n', '<leader>lf', function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

        ['marksman'] = function()
          local config = make_config()
          lspconfig.marksman.setup(config)
        end,

        ['tsserver'] = function()
          local config = make_config()
          lspconfig.tsserver.setup(config)
        end,

        ['vuels'] = function()
          local config = make_config()
          lspconfig.vuels.setup(config)
        end,

        ['html'] = function()
          local config = make_config()
          config.settings = {
            init_options = {
              configurationSection = { 'html', 'css', 'vue' },
              embeddedLanguages = {
                css = true,
                vue = true,
              },
              provideFormatter = true,
            },
          }
          lspconfig.html.setup(config)
        end,
      })
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
