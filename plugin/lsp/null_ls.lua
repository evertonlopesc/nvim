local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local diagnostics = nls.builtins.diagnostics
local formatting = nls.builtins.formatting
local sources = {}

sources = {
  sources = {
    diagnostics.erb_lint,
    formatting.erb_lint,
  },
}

nls.setup({
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})
