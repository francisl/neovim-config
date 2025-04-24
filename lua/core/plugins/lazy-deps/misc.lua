return {
  'nvim-lua/plenary.nvim',
  -- Git
  'tpope/vim-fugitive',
  { 'echasnovski/mini.nvim', version = '*' },
  'mbbill/undotree',
  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
  },
  'mfussenegger/nvim-lint',
  'stevearc/oil.nvim',
  'nvim-lualine/lualine.nvim',
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "christoomey/vim-tmux-navigator",
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  "MunifTanjim/nui.nvim",
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
   "folke/which-key.nvim",
   event = "VeryLazy",
   opts = {
    preset = "helix",
    win = {
      border = "rounded",
      padding = { 2, 2 },
      wo = {
        winblend = 2 
      }
    },
    layout = {
      width = { min = 20, max = 35 },
      spacing = 4,
    },
   },
   keys = {
     {
       "<leader>?",
       function()
           require("which-key").show({ global = false })
         end,
         desc = "Buffer Local Keymaps (which-key)",
       },
     },
   },
}
