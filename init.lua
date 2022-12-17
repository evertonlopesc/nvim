local status, plugins = pcall(require, "plugins")
local status, options = pcall(require, "options")
local status, _ = pcall(require, "lsp.progress_update")

if not status then
  return
end
