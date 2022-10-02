local gitsigns = require "gitsigns"

gitsigns.setup {
  current_line_blame = false,
}

vim.keymap.set("n", "]c", gitsigns.next_hunk)
vim.keymap.set("n", "[c", gitsigns.prev_hunk)
vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk)
vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)
vim.keymap.set("n", "<leader>gb", function()
  gitsigns.blame_line { full = true }
end)
vim.keymap.set({ "o", "x" }, "<leader>gh", gitsigns.select_hunk)
