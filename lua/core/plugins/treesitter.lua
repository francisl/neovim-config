require('nvim-treesitter').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "help", "lua", "go", "javascript", "typescript", "nim", "vim", "zig" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

