local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "<S-K>K", "<ESC>")

-- deletion
keymap.set("n", "x", '"_x')

-- keymap.set("n", "<leader>+", "<C-a>")
-- keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<C-a>", "ggVG")

-- Search
--
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Split screen
keymap.set("n", "<leader>wsh", "<C-w>v", { desc = "Split window vertically" })     -- split vert
keymap.set("n", "<leader>wsv", "<C-w>s", { desc = "Split window horizontally" } )     -- split hori
keymap.set("n", "<leader>wse", "<C-w>=", { desc = "Make split windows equal width" })     -- make split windows equal width

keymap.set("n", "<leader>wto", ":tabnew<CR>", { desc = "Open new tab" })   -- open new tab
keymap.set("n", "<leader>wtx", ":tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>wtn", ":tabn<CR>", { desc = "Go to next tab" })     --  go to next tab
keymap.set("n", "<leader>wtp", ":tabp<CR>", { desc = "Go to previous tab" })     --  go to previous tab

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- plugins
-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
-- keymap.set("n", "<leader>bt", ":NvimTreeFindFileToggle<CR>")
-- keymap.set("n", "<leader>bf", ":NvimTreeFocus<CR>")
-- keymap.set("n", "<leader>bb", ":NvimTreeFindFile<CR>")

-- undotree
vim.keymap.set("n", "<leader>et", vim.cmd.UndotreeToggle, { desc = "Undo Tree Toggle" })
vim.keymap.set("n", "<leader>ef", vim.cmd.UndotreeFocus, { desc = "Undo Tree Focus" })

-- tmux
keymap.set('n', '<c-k>', ':wincmd k<cr>')
keymap.set('n', '<c-j>', ':wincmd j<cr>')
keymap.set('n', '<c-h>', ':wincmd h<cr>')
keymap.set('n', '<c-l>', ':wincmd l<cr>')
keymap.set('n', '<c-l>', ':TmuxNavigateRight<cr>')
keymap.set('n', '<c-k>', ':TmuxNavigateUp<cr>')
keymap.set('n', '<c-j>', ':TmuxNavigateDown<cr>')
keymap.set('n', '<c-h>', ':TmuxNavigateLeft<cr>')

-- Temporary resize mode
keymap.set("n", "<leader>wr", function()
  vim.cmd("echo 'Resize mode (hjkl to resize, q or Esc to quit)'")
  local mode = true
  while mode do
    local char = vim.fn.getchar()
    if type(char) == "number" then
      char = vim.fn.nr2char(char)
      if char == "l" then vim.cmd("vertical resize -2") end
      if char == "h" then vim.cmd("vertical resize +2") end
      if char == "j" then vim.cmd("resize +2") end
      if char == "k" then vim.cmd("resize -2") end
      if char == "q" or char == "\27" then mode = false end -- \27 is Esc
      vim.cmd("redraw") -- Force UI update after each action
    end
  end
end, { desc = "Enter temporary resize mode" })

