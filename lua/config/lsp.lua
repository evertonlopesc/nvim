local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

local function common_on_attach(bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = common_on_attach,
    handlers = {
      ['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false}
      ),
    },
  }

  server:setup(opts)
  vim.cmd('do User LspAttachBuffers')
end)

lsp_installer.settings {
  ui = {
    icons = {
        server_installed = '✓',
        server_pending = '➜',
        server_uninstalled = '✗'
    }
  }
}

