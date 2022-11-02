# Neovim v0.7.2

## Installation

### Download to packer.nvim

> Unix, Linux Installation

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

If you use Arch Linux, there is also [an AUR package](https://aur.archlinux.org/packages/nvim-packer-git).

Clone this repository

```sh
git clone https://github.com/evertonlopesc/nvim.git ~/.config/
```

### Requirements

_I'm using [asdf-vm](https://asdf-vm.com/) to install dependencies._

- Neovim (version: 0.7.2)
- Lua (version: 5.4.4)
- LuaJIT (version: 2.0.5--2.4.4)
- Ripgrep (version: 13.0.0)
- Fd (version: 8.4.0)
- Fzf (version: 0.30.0)
- Lazygit (version: 0.34)
- Github-cli (version: 2.14.1)

### Installing plugins

- Go to ~/.config/nvim/
- Open the file in `lua/plugins.lua` and run the command to install all plugins.
- Run `:PackerInstall`

---

## Main plugins

### Plugin Manager

- 'wbthomason/packer.nvim'

### LSP

- 'neovim/nvim-lspconfig'
- "williamboman/mason.nvim",
- "williamboman/mason-lspconfig.nvim",

### Completion & Snippet

- 'hrsh7th/nvim-cmp'
- 'L3MON4D3/LuaSnip'

### Syntax

- 'nvim-treesitter/nvim-treesitter'

### Fuzzy Finder

- 'ibhagwan/fzf-lua'
- 'nvim-telescope/telescope.nvim'

### Colorscheme

- "EdenEast/nightfox.nvim"
- "catppuccin/nvim"

### Statusline

- 'nvim-lualine/lualine.nvim'

### Startup

- 'glepnir/dashboard-nvim'

### File explorer

- 'kyazdani42/neo-tree.lua'

### Git

- 'lewis6991/gitsigns.nvim'
- 'TimUntersberger/neogit'
- 'sindrets/diffview.nvim'
