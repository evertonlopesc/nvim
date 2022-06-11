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
  border = "single"
})

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end

    else
      util.jump_to_location(result)
    end
  end

  return handler
end

lsp_handlers["textDocument/definition"] = goto_definition('split')

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
  init_options = { formatting = true },
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.zk.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_handlers
}
