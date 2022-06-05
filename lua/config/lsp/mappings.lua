-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>lp', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>lsl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>ltd', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>le', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end
