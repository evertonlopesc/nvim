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

local lspconfig = require('lspconfig')
local lsp_protocal = vim.lsp.protocol.make_client_capabilities()
local lsp_handlers = vim.lsp.handlers

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>lp', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>lsl', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
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

  require "lsp_signature".on_attach()
end

lsp_handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 2,
  },
  signs = function(namespace, bufnr)
    return vim.b[bufnr].show_signs == true
  end,
  update_in_insert = false,
})

local on_references = lsp_handlers["textDocument/references"]
lsp_handlers["textDocument/references"] = vim.lsp.with(
  on_references, {
  -- Use location list instead of quickfix list
  loclist = true,
})

lsp_handlers["textDocument/hover"] = vim.lsp.with(
  lsp_handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single"
})

local capabilities = lsp_protocal
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = require 'nvim-lsp-installer.servers'
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach(),
    capabilities = capabilities,
    handlers = lsp_handlers
  }
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- SETUP
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
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
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.prosemd_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers,
  flags = lsp_flags
}
