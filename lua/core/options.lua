vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.backup = false
opt.swapfile = false
opt.smartindent = true

-- use spaces for tabs and whatnot
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 8

--Line numbers
opt.nu = true
opt.relativenumber = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- cursor line
opt.cursorline = true


-- nvimtree
update_focused_file = { enable = true }
-- comment

