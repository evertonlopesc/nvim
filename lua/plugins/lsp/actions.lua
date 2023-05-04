M = {}

function M.nmap(key, command, desc, buffer)
  vim.keymap.set(
    'n',
    key,
    command,
    { desc = desc, noremap = true, silent = true, buffer = buffer }
  )
end

function M.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  M.nmap('<leader>lc', vim.lsp.buf.declaration, 'Lsp declaration', bufnr)
  M.nmap('<leader>ld', vim.lsp.buf.definition, 'Lsp definition', bufnr)
  M.nmap('<leader>lk', vim.lsp.buf.hover, 'Lsp hover', bufnr)
  M.nmap('<leader>li', vim.lsp.buf.implementation, 'Lsp implementation', bufnr)
  M.nmap('<leader>ls', vim.lsp.buf.signature_help, 'Lsp signature help', bufnr)
  M.nmap('<leader>lrn', vim.lsp.buf.rename, 'Lsp rename', bufnr)
  M.nmap('<leader>la', vim.lsp.buf.code_action, 'Lsp code action', bufnr)
  M.nmap('<leader>lr', vim.lsp.buf.references, 'Lsp references', bufnr)
  M.nmap(
    '<leader>ltd',
    vim.lsp.buf.type_definition,
    'Lsp type definition',
    bufnr
  )
  M.nmap('<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, 'Lsp format', bufnr)
end

return M
