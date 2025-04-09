require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "go", "templ", "javascript", "typescript", "nim", "vim", "zig", "vimdoc" }, -- Replaced "help" with "vimdoc"
  highlight = {
    enable = true,
  },
})

