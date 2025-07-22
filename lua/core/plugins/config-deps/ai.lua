vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]

vim.keymap.set("i", "<C-Enter>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set("n", "<leader>is", function()
    vim.cmd("Copilot panel")
end, {
    desc = "Copilot panel"
})

-- vim.notify("Copilot setup complete")
