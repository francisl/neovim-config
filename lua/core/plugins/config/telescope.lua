local actions = require('telescope.actions')

local telescope = require('telescope')

telescope.setup({
  -- configure custom mappings
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  defaults = {
    mappings = {
      n = {
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist, -- move to prev result
      },
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist, -- move to prev result
      },
    },
    -- imgrep_arguments = {
    --  '--line-number',
    --  '--column',
    --  '-uu'
    -- ,
    file_ignore_patterns = { ".git/", "package-lock.json", "node_modules/", "build/", "coverage/", "dist/", "lib/", "core/"}
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
      -- the picker to use for this extension, sets the default extension
      picker = "builtin",
      -- the prompt title that shows up in the prompt when selecting a file
      prompt_title = "File Browser",
      -- the cwd will be the entry node for the file browser
      -- cwd = "~/.config/nvim",
    },
    live_grep_args = {
      auto_quoting = true,
      noremap = true
    },
--    grep_string = {
--      search = vim.fn.input("Grep > ")
--    }
  },
})

telescope.load_extension("fzf")
-- Load other extensions only when needed
-- telescope.load_extension("file_browser")
-- telescope.load_extension("live_grep_args")
-- telescope.load_extension("grep_string")
-- telescope.builtin.grep_string({ search = vim.fn.input("Grep > ")})
