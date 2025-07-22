require("codecompanion").setup({
  -- You can customize these options based on your needs
  chat = {
    window = {
      border = "rounded",
      width = 0.8,    -- Percentage of editor width
      height = 0.8,   -- Percentage of editor height
    },
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

-- Add keymaps for quick access
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanion<cr>", { desc = "Open CodeCompanion" })
vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanion<cr>", { desc = "Open CodeCompanion with selection" })