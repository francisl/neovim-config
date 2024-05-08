local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "<S-K>K", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- deletion
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<C-a>", "ggVG")

-- Search
--
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Split screen
keymap.set("n", "<leader>sv", "<C-w>v") -- split vert
keymap.set("n", "<leader>sn", "<C-w>s") -- split hori
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>sh", "<C-w>h")
keymap.set("n", "<leader>sl", "<C-w>l")
keymap.set("n", "<leader>sk", "<C-w>k")
keymap.set("n", "<leader>sj", "<C-w>j")

keymap.set("n", "<C-_>", "<C-w><") --  go to previous tab
keymap.set("n", "<C-=>", "<C-w>>") --  go to previous tab

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- debugging
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>bt", ":NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>bf", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>bb", ":NvimTreeFindFile<CR>")

-- telescope

keymap.set("n", "<leader>fp", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

keymap.set("n", "<leader>ff", "<cmd>Telescope file_browser<cr>") -- list available help tags
keymap.set("n", "<leader>fc", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>") -- list available help tags

-- undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus)

