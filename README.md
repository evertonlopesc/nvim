# Neovim v0.7.2

## Installation

Download to packer.nvim

> Unix, Linux Installation
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

If you use Arch Linux, there is also [an AUR package](https://aur.archlinux.org/packages/nvim-packer-git).

Clone this repository

```sh
git clone https://github.com/evertonlopesc/nvim.git
```
Requirements (I'm using [asdf-vm](https://asdf-vm.com/) to install dependencies)

- neovim        (version: 0.7.2)
- lua           (version: 5.4.4)
- luaJIT        (version: 2.0.5--2.4.4)
- ripgrep       (version: 13.0.0)
- fd            (version: 8.4.0)
- fzf           (version: 0.30.0)
- lazygit       (version: 0.34)
- github-cli    (version: 2.14.1)

Next step:
- go to ~/.config/nvim/
- open the file in lua/plugins.lua and run the command to install all plugins.
- run `:PackerInstall`
___

![image](https://user-images.githubusercontent.com/16230069/190534549-9b0e5d11-a15b-4f67-a7f9-e3e1d06f0a76.png)

## Main plugins

### Plugin Manager
use 'wbthomason/packer.nvim'

### LSP
- use 'neovim/nvim-lspconfig'
- "williamboman/mason.nvim",
- "williamboman/mason-lspconfig.nvim",

![image](https://user-images.githubusercontent.com/16230069/190533815-3eaccf2e-6b4b-4083-9606-621b155e0409.png)


### Completion & Snippet
- use 'hrsh7th/nvim-cmp'
- use 'L3MON4D3/LuaSnip'

![image](https://user-images.githubusercontent.com/16230069/190533909-2f7b2008-df5d-48d7-9de4-56a7bf98dc71.png)

### Syntax
- use 'nvim-treesitter/nvim-treesitter'

### Fuzzy Finder
- use 'ibhagwan/fzf-lua'
- use 'nvim-telescope/telescope.nvim'

![image](https://user-images.githubusercontent.com/16230069/190534001-495b609c-0e24-475b-a354-7c9ec5a611df.png)

### Colorscheme
- use "EdenEast/nightfox.nvim", tag = "v1.0.0"

### Tabline
- use 'akinsho/bufferline.nvim'

![image](https://user-images.githubusercontent.com/16230069/190534038-baaab364-1927-452f-8e8d-74962726dbcf.png)

### Statusline
- use 'nvim-lualine/lualine.nvim'

![image](https://user-images.githubusercontent.com/16230069/190534130-8818e8de-6458-469c-b433-89ec2ace4ec6.png)

### Startup
- use 'glepnir/dashboard-nvim'

![image](https://user-images.githubusercontent.com/16230069/192253688-236648dd-6e09-4791-b8b8-6f5838d2bf4c.png)

### File explorer
- use 'kyazdani42/neo-tree.lua'

![image](https://user-images.githubusercontent.com/16230069/190534250-002a0e09-f3fe-4cad-90d7-e5981d464c1e.png)

### Git
- use 'lewis6991/gitsigns.nvim'
