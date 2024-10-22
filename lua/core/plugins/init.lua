local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- 'wbthomason/packer.nvim',
  -- themes
  'ellisonleao/gruvbox.nvim',
  'rebelot/kanagawa.nvim',
  'mhartington/oceanic-next',
  'EdenEast/nightfox.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  -- tree
  'nvim-tree/nvim-tree.lua',
  -- 'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'bluz71/vim-nightfly-colors',
  'vim-test/vim-test',
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',

  -- nim
  'alaviss/nim.nvim',

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
  {
    "nvim-telescope/telescope-live-grep-args.nvim"
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",
    'mbbill/undotree',
  'ThePrimeagen/harpoon',
  'tpope/vim-fugitive',
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  'mfussenegger/nvim-lint'
}

local opts = {}

require("lazy").setup(plugins, opts)
require("core.plugins.lualine")
require("core/plugins/mason")
require("core/plugins/completions")
require("core/plugins/lsp")
require("core/plugins/telescope")
require("core/plugins/nvim-tree")
require("core/plugins/treesitter")
require("core/plugins/harpoon")
require("core/plugins/fugitive")
require("core/plugins/copilot")
require('go').setup()
require('core/plugins/swift')
require('core.plugins.templ')

