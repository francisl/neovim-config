return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Additional recommended plugins for better experience
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
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
  },
  config = function()
    require("codecompanion").setup({
      -- Default configuration
      chat = {
        -- Chat buffer configuration
        keymaps = {
          close = "q",
          draft = "<C-d>",
          edit_input = "i",
          edit_input_line = "I",
          new_file = "<C-n>",
          redo = "<C-r>",
          reset = "<C-l>",
          submit = "<CR>",
          submit_draft = "<C-s>",
          switch_model = "<C-m>",
          toggle_diff = "<C-d>",
          toggle_help = "?",
          toggle_settings = "<C-o>",
          undo = "<C-u>",
        },
      },
    })
  end,
}
