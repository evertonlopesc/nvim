-- LSP CONFIG/LSP-INSTALLER

local lsp_installer = require 'nvim-lsp-installer'
local lsp_vim = vim.lsp
local cmd = vim.cmd

require 'luasnip'.filetype_extend("ruby", {"rails"})

local capabilities = lsp_vim.protocol.make_client_capabilities()
capabilities = require 'cmp_nvim_lsp'.update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
      ['textDocument/publishDiagnostics'] = lsp_vim.with(
        lsp_vim.diagnostic.on_publish_diagnostics, {virtual_text = false}
      ),
    },
  }

  server:setup(opts)
  cmd('do User LspAttachBuffers')
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

-- TROUBLE CONFIG
require('trouble').setup {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  action_keys = { -- key mappings for actions in the trouble list
      -- map to {} to remove a mapping, for example:
      -- close = {},
      close = "q", -- close the list
      cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
      refresh = "r", -- manually refresh
      jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
      open_split = { "<c-x>" }, -- open buffer in new split
      open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
      open_tab = { "<c-t>" }, -- open buffer in new tab
      jump_close = {"o"}, -- jump to the diagnostic and close the list
      toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
      toggle_preview = "P", -- toggle auto_preview
      hover = "K", -- opens a small popup with the full multiline message
      preview = "p", -- preview the diagnostic location
      close_folds = {"zM", "zm"}, -- close all folds
      open_folds = {"zR", "zr"}, -- open all folds
      toggle_fold = {"zA", "za"}, -- toggle fold of current file
      previous = "k", -- preview item
      next = "j" -- next item
  },
  indent_lines = true, -- add an indent guide below the fold icons
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = false, -- automatically close the list when you have no diagnostics
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false, -- automatically fold a file trouble list at creation
  auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
  signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠"
  },
  use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

local function get_notif_data(client_id, token)
 if not client_notifs[client_id] then
   client_notifs[client_id] = {}
 end

 if not client_notifs[client_id][token] then
   client_notifs[client_id][token] = {}
 end

 return client_notifs[client_id][token]
end

local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
 local notif_data = get_notif_data(client_id, token)

 if notif_data.spinner then
   local new_spinner = (notif_data.spinner + 1) % #spinner_frames
   notif_data.spinner = new_spinner

   notif_data.notification = vim.notify(nil, nil, {
     hide_from_history = true,
     icon = spinner_frames[new_spinner],
     replace = notif_data.notification,
   })

   vim.defer_fn(function()
     update_spinner(client_id, token)
   end, 100)
 end
end

local function format_title(title, client_name)
 return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
 return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
 local client_id = ctx.client_id

 local val = result.value

 if not val.kind then
   return
 end

 local notif_data = get_notif_data(client_id, result.token)

 if val.kind == "begin" then
   local message = format_message(val.message, val.percentage)

   notif_data.notification = vim.notify(message, "info", {
     title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
     icon = spinner_frames[1],
     timeout = false,
   hide_from_history = false,
   })

   notif_data.spinner = 1
   update_spinner(client_id, result.token)
 elseif val.kind == "report" and notif_data then
   notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
     replace = notif_data.notification,
     hide_from_history = false,
   })
 elseif val.kind == "end" and notif_data then
   notif_data.notification =
     vim.notify(val.message and format_message(val.message) or "Complete", "info", {
       icon = "",
       replace = notif_data.notification,
       timeout = 3000,
     })

   notif_data.spinner = nil
 end
end

-- table from lsp severity to vim severity.
local severity = {
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
             vim.notify(method.message, severity[params.type])
end
