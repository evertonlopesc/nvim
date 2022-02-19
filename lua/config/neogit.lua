require('plenary')
local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  commit_popup = {
      kind = "split",
  },
  kind = "tab",
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true  
  },
}
