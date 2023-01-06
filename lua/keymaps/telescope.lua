local nmap = require("./../config/map").nmap

local builtin = require("telescope.builtin")

nmap("<leader>st", ":Telescope <CR>")
nmap("<leader>sf", builtin.find_files)
nmap("<leader>sg", builtin.live_grep)
nmap("<leader>so", builtin.oldfiles)
nmap("<leader>sl", builtin.lsp_document_symbols)
nmap("<leader>b", builtin.buffers)
nmap("<leader>sk", builtin.keymaps)
