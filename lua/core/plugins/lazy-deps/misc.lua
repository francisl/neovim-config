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
    config = function(_, opts)
      local wk = require("which-key")
        wk.setup(opts)
        wk.add({
          { "<leader>/", group = "Search" },
          { "<leader>b", group = "Buffer" },
          { "<leader>c", group = "Code" },
          { "<leader>ce", group = "Code Errors" },
          { "<leader>e", group = "Edit", icon = "" },
          { "<leader>f", group = "Files" },
          { "<leader>g", group = "Git" },
          { "<leader>ga", group = "Git Actions" },
          { "<leader>h", group = "Harpoon" },
          { "<leader>i", group = "AI" },
          { "<leader>s", group = "Snacks", icon = "󰉚 " },
          { "<leader>u", group = "UI Toggle" },
          { "<leader>ut", group = "UI Theme" },
          { "<leader>w", group = "Window" },
          { "<leader>ws", group = "Window Split" },
          { "<leader>wt", group = "Window Tabs" },
        })
    end,
    opts = {
      preset = "modern",
      notify = true,
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
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
