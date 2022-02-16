
local function set_keymap(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

-- normal {{{1
set_keymap('n', {noremap=true, silent=true}, {
  -- remap leader keys to noop
  {' ', ''},
  {'\\', ''},

  -- Resource
  {'<F5>', ":luafile %<CR>"},

  -- TrimWhiteSpace
  {'<F2>', ":%s/\\s*$//<CR>"},

  -- Resize
  {'<Down>', ":resize -5<CR>"},
  {'<Up>', ":resize +5<CR>"},
  {'<Left>', ":vertical resize -5<CR>"},
  {'<Right>', ":vertical resize +5<CR>"},

  -- move between split
  {'<C-h>', "<C-w>h"},
  {'<C-j>', "<C-w>j"},
  {'<C-k>', "<C-w>k"},
  {'<C-l>', "<C-w>l"},

  -- Buffers
  {'<c-n>', ':BufferLineCycleNext<CR>'},
  {'<c-p>', ':BufferLineCyclePrev<CR>'},
  {']c', "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
  {'[c', "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
})


-- normal wit expr {{{2
set_keymap('n', {noremap=true, expr=true, silent=true}, {
  {'k', "v:count == 0 ? 'gk' : 'k'"},
  {'j', "v:count == 0 ? 'gj' : 'j'"},
})

-- visual {{{1
set_keymap('x', {noremap=true, silent=true}, {
  {'ii', '<ESC>'},

  -- better indent
  {'<', '<gv'},
  {'>', '>gv'},

  -- move selected line(s)
  {'K', ':move \'<-2<CR>gv-gv'},
  {'J', ':move \'>+1<CR>gv-gv'},
})

-- insert {{{1
set_keymap('i', {noremap=true, silent=true}, {
    -- alternative esc
    {'jk', '<Esc>'},

    -- navigate display lines
    {'<Down>', '<Esc>gja'},
    {'<Up>', '<Esc>gka'},
})

-- terminal {{{1
set_keymap('t', {noremap=true, silent=true}, {
    -- escape in terminal
    {'<Esc>', [[<C-\><C-n>]]},
})

-- leader {{{1
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local wk = require('whichkey_setup')

local keymap = {
  -- general
  w = {'<Cmd>w<CR>', 'save file'},
  W = {'<Cmd>wa<CR>', 'save all'},
  d = {'<Cmd>bdelete<CR>', 'delete buffer'},
  x = {'<Cmd>q<CR>', 'quit file'},
  X = {'<Cmd>qa<CR>', 'quit all'},
  q = {'<Cmd>BufferLinePick<CR>', 'buffer pick'},
  Q = {'<Cmd>wa<CR><Cmd>qa<CR>', 'save quit all'},
  p = {
    name = '+packer',
    s = {'<cmd>PackerSync<CR>', 'packer sync'},
    i = {'<cmd>PackerInstall<CR>', 'packer install'},
    u = {'<cmd>PackerUpdate<CR>', 'packer update'},
  },
  ["<Space>"] = {'<cmd>set hlsearch!<CR>', 'no highlight'},
  z = {
    name = '+fuzzy',
    b = {"<cmd>lua require('fzf-lua').builtin()<CR>", 'fzf builtin'},
    f = {"<cmd>lua require('fzf-lua').files()<CR>", 'fzf files'},
  },
  f = {
    name = '+telescope',
    f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", 'search files'},
    g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", 'search word'},
    b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", 'buffers'},
    h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", 'tags'},
    s = {"<cmd>lua require('telescope.builtin').search_history()<cr>", 'history'},
    c = {"<cmd>lua require('telescope.builtin').command_history()<cr>", 'command history'},
    o = {"<cmd>lua require('telescope.builtin').oldfiles()<cr>", 'old files'},
    r = {"<cmd>lua require('telescope.builtin').resume()<cr>", 'resume'},
    q = {"<cmd>lua require('telescope.builtin').quickfix()<cr>", 'quickfix'},
    j = {"<cmd>lua require('telescope.builtin').jumplist()<cr>", 'jumplist'},
    w = {"<cmd>lua require('telescope.builtin').file_browser()<cr>", 'browser'},
    n = {":NvimTreeToggle<CR>", 'NvimTreeToggle open'},
  },
  ['gi'] = {"<cmd>Neogit<CR>", 'git'},
  n = {
    name = '+notepad',
    o = {"<cmd>e note.md<CR>", 'open notepad'},
    c = {"<cmd>!rm -rf note.md<CR>", 'delete notepad'},
  },
  l = {
    name = '+lsp',
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'code action'},
    A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder'},
    d = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'definiction'},
    D = {'<cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration'},
    e = {'<cmd>lua vim.lsp.buf.references()<CR>', 'references'},
    f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'formattiong'},
    k = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
    i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workscace folders'},
    L = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set loclist'},
    r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
    R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder'},
    s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'segnature help'},
    S = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostics'},
    T = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
    ['[f'] = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'goto prev'},
    [']f'] = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'goto next'},
    t = {"<cmd>Trouble<CR>", 'trouble lsp'},
  },
  e = {
    name = '+emmet',
    m = {":Emmet ", 'html tag'},
  },
  h = {
    name = '+gitsigns',
    b = {'<cmd>lua require"gitsigns".blame_line(true)<CR>', 'blame line'},
    p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', 'preview hunk'},
    r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', 'reset hunk'},
    R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', 'reset buffer'},
    s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', 'stage hunk'},
    S = {'<cmd>lua require"gitsigns".stage_buffer()<CR>', 'stage buffer'},
    u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'undo stage hunk'},
    U = {'<cmd>lua require"gitsigns".reset_buffer_index()<CR>', 'reset buffer index'},
    ['ih'] = {':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', 'select hunk'},
  },
  t = {
    name = '+terminal',
    t = {'<cmd>ToggleTerm<CR>', 'terminal open'},
  }
}

local visual_keymap = {
    K = {':move \'<-2<CR>gv-gv', 'move line up'},
    J = {':move \'>+1<CR>gv-gv', 'move line down'},
  c = {
    name = '+kommentary',
    i = {"<Plug>kommentary_visual_increase", 'visual increase'},
    d = {"<Plug>kommentary_visual_decrease", 'visual decrease'},
  },
  h = {
    name = '+gitsings',
    r = {'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', 'visual reset hunk'},
    s = {'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', 'visual stage hunk'},
    ['ih'] = {':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', 'visual select hunk'},
  }
}

local local_keymap = {
  -- waiting code
}

wk.register_keymap('leader', keymap)
wk.register_keymap('leader', visual_keymap, {mode = 'v'})
wk.register_keymap('localleader', local_keymap)
