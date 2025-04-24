return {
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  {
    'nvimdev/lspsaga.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',   -- optional
      'nvim-tree/nvim-web-devicons',       -- optional
    }
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts ={},
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
}
