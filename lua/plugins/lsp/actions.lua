local M = {}

function M.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set(
    'n',
    '<leader>lc',
    vim.lsp.buf.declaration,
    { desc = 'Lsp declaration', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>ld',
    vim.lsp.buf.definition,
    { desc = 'Lsp definition', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>lk',
    vim.lsp.buf.hover,
    { desc = 'Lsp hover', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>li',
    vim.lsp.buf.implementation,
    { desc = 'Lsp implementation', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>ls',
    vim.lsp.buf.signature_help,
    { desc = 'Lsp signature help', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>ltd',
    vim.lsp.buf.type_definition,
    { desc = 'Lsp type definition', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>lrn',
    vim.lsp.buf.rename,
    { desc = 'Lsp rename', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>la',
    vim.lsp.buf.code_action,
    { desc = 'Lsp code action', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set(
    'n',
    '<leader>lr',
    vim.lsp.buf.references,
    { desc = 'Lsp references', noremap = true, silent = true, buffer = bufnr }
  )
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Lsp format', noremap = true, silent = true, buffer = bufnr })
end

return M
