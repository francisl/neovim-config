-- GIT PLUGIN

-- git sign
--

-- Fugitive
vim.keymap.set("n", "<leader>G", vim.cmd.Git, { desc = "Git status" })

local Fl_Fugitive = vim.api.nvim_create_augroup("Fl_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = Fl_Fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>pu", function()
      vim.cmd.Git('push')
    end, vim.tbl_extend("force", opts, { desc = "Git push" }))

    -- rebase always
    vim.keymap.set("n", "<leader>r",
      ':Git rebase -i main',
      vim.tbl_extend("force", opts, { desc = "Git rebase Interactive" }))

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set("n", "<leader>po", ":Git push -u origin ",
      vim.tbl_extend("force", opts, { desc = "Git push origin" }))

    vim.keymap.set("n", "<leader>f", ":Git fetch --all",
      vim.tbl_extend("force", opts, { desc = "Git Fetch" }))
  end,
})
