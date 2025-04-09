vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- General settings
opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.autoread = true
opt.backup = false
opt.swapfile = false
opt.smartindent = true
opt.termguicolors = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 8

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Appearance
opt.cursorline = true

-- File browser
opt.hidden = true
opt.confirm = true

-- Performance
opt.updatetime = 300
opt.timeoutlen = 500

-- NvimTree configuration
vim.g.nvim_tree_update_focused_file = { enable = true }

