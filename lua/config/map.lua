local M = {}

local keymap = vim.keymap.set
local options = { noremap = true, silent = true }

function M.map(mode, command, action, opts)
  opts = opts or options

  keymap(mode, command, action, opts)
end

function M.nmap(command, action, opts)
  M.map("n", command, action, opts)
end

function M.vmap(command, action, opts)
  M.map("v", command, action, opts)
end

function M.imap(command, action, opts)
  M.map("i", command, action, opts)
end

function M.xmap(command, action, opts)
  M.map("x", command, action, opts)
end

function M.omap(command, action, opts)
  M.map("o", command, action, opts)
end

function M.tmap(command, action, opts)
  M.map("t", command, action, opts)
end

return M
