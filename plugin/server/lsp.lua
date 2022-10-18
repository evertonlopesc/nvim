local msn = require "mason"
local msn_lspc = require "mason-lspconfig"
local lspc = require "lspconfig"
local servers = msn_lspc.get_installed_servers()
local on_attach = require("lsp.config").config(client, bufnr)
local opts = { noremap = true, silent = true }

msn.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

msn_lspc.setup {
  ensure_installed = {
    "sumneko_lua",
  },

  automactic_installation = true,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspc.sumneko_lua.setup {
  settings = {
    lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

lspc.tailwindcss.setup {
  filetypes = { "html", "eruby", "vue" },
}

for _, server in ipairs(servers) do
  lspc[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.keymap.set("n", "<leader>m", ":Mason<CR>", opts)
