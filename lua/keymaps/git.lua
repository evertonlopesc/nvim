local m = require('./../config/map')

local nmap = m.nmap
local omap = m.omap
local xmap = m.xmap

-- Neogit
local neogit = require('neogit')
nmap('<leader>g', ':Neogit <CR>')
nmap('<leader>gc', ':Neogit commit <CR>')

-- Gitsigns
local gitsigns = require('gitsigns')

nmap(']c', gitsigns.next_hunk)
nmap('[c', gitsigns.prev_hunk)
nmap('<leader>gd', gitsigns.diffthis)
nmap('<leader>gs', gitsigns.stage_hunk)
nmap('<leader>gr', gitsigns.reset_hunk)
nmap('<leader>gp', gitsigns.preview_hunk)
nmap('<leader>gb', function()
  gitsigns.blame_line({ full = true })
end)
omap('<leader>gh', gitsigns.select_hunk)
xmap('<leader>gh', gitsigns.select_hunk)
