require("nvim-lsp-installer").setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local on_attach = function()
  require('lua/config/lsp/mappings')
end

local lspconfig = require('lspconfig')
local lsp_protocal = vim.lsp.protocol.make_client_capabilities()

local capabilities = lsp_protocal
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = require 'nvim-lsp-installer.servers'
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 4,
  },
  signs = function(namespace, bufnr)
    return vim.b[bufnr].show_signs == true
  end,
  update_in_insert = false,
})

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
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
}

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  formatting = true
}
lspconfig.html.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.cssls.setup {}
lspconfig.clangd.setup {}
lspconfig.jsonls.setup {}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.vuels.setup {}
lspconfig.zk.setup {}
lspconfig.rust_analyzer.setup {}
