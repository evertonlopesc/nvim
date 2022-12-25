local gitsigns = require('gitsigns')

local m = require("./../config/map")

local nmap = m.nmap
local omap = m.omap
local xmap = m.xmap

nmap("]c", gitsigns.next_hunk)
nmap("[c", gitsigns.prev_hunk)
nmap("<leader>gs", gitsigns.stage_hunk)
nmap("<leader>gr", gitsigns.reset_hunk)
nmap("<leader>gp", gitsigns.preview_hunk)
nmap("<leader>gu", gitsigns.undo_stage_hunk)
nmap("<leader>gd", gitsigns.diffthis)
nmap("<leader>gb", function()
  gitsigns.blame_line({ full = true })
end)
omap("<leader>gh", gitsigns.select_hunk)
xmap("<leader>gh", gitsigns.select_hunk)
