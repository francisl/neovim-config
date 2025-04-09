return {
  -- Git
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',

  'tpope/vim-commentary',
  'mbbill/undotree',
  'ThePrimeagen/harpoon',
  'sbdchd/neoformat',
  'mfussenegger/nvim-lint',
  'stevearc/oil.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  "christoomey/vim-tmux-navigator",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>tm?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}

