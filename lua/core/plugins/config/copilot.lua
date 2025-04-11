--highlight gray
--highlight gray guifg=#5c6370
vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]

vim.keymap.set("i", "<C-Enter>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set("n", "<leader>cs", 'copilot#Suggestion("\\<CR>")', {
  expr = true,
  replace_keycodes = false
}, "Copilot Suggestion")

