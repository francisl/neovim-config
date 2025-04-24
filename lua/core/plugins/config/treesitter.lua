-- Tree Sitter configuration - Use to highlight code and provide syntax-aware editing features

require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "go", "templ", "javascript", "json", "typescript", "nim", "vim", "zig", "vimdoc" }, -- Replaced "help" with "vimdoc"
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

