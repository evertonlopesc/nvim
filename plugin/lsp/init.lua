local mason = require("mason")
local mason_lspc = require("mason-lspconfig")
local lspc = require("lspconfig")
local nls = require("null-ls").builtins
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local servers = mason_lspc.get_installed_servers()

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspc.setup({
  ensure_installed = {
    "sumneko_lua",
    "solargraph",
    "tsserver",
  },

  automactic_installation = true,
})

-- Mappings.
keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local vlsp = vim.lsp.buf

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap('n', '<leader>lD', vlsp.declaration, bufopts)
  keymap('n', '<leader>ld', vlsp.definition, bufopts)
  keymap('n', 'K', vlsp.hover, bufopts)
  keymap('n', '<leader>li', vlsp.implementation, bufopts)
  keymap('n', '<C-k>', vlsp.signature_help, bufopts)
  keymap('n', '<leader>la', vlsp.add_workspace_folder, bufopts)
  keymap('n', '<leader>lr', vlsp.remove_workspace_folder, bufopts)
  keymap('n', '<leader>ll', function()
    print(vim.inspect(vlsp.list_workspace_folders()))
  end, bufopts)
  keymap('n', '<leader>lt', vlsp.type_definition, bufopts)
  keymap('n', '<leader>lr', vlsp.rename, bufopts)
  keymap('n', '<leader>lc', vlsp.code_action, bufopts)
  keymap('n', 'gr', vlsp.references, bufopts)
  keymap('n', '<leader>lf', vlsp.formatting, bufopts)
end

lspc.sumneko_lua.setup {
  settings = {
    lua = {
      runtime = {
        version = "Lua 5.4",
        path = { '~/.config/nvim/init.lua' },
      },
    }
  }
}

for _, server in ipairs(servers) do
  lspc[server].setup {
    on_attach = on_attach
  }
end
