return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 900,
    build = ":MasonUpdate",
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
  },
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "ionide/ionide-vim",
    ft = { "fs", "fsharp", "fsx" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  }
}
