return {
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
    'mbbill/undotree',
    'ThePrimeagen/harpoon',
    'sbdchd/neoformat',
    'mfussenegger/nvim-lint',
    "christoomey/vim-tmux-navigator",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}