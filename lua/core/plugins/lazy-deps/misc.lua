return {
  'nvim-lua/plenary.nvim',
  -- Git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  { 'echasnovski/mini.nvim', version = '*' },
  'tpope/vim-commentary',
  'mbbill/undotree',
  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
  },
  'sbdchd/neoformat',
  'mfussenegger/nvim-lint',
  'stevearc/oil.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  "christoomey/vim-tmux-navigator",
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
   opts = {},
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
