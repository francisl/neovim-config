return {
    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        dependencies = { 
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope-file-browser.nvim',
          'nvim-telescope/telescope-fzf-native.nvim',
          'nvim-telescope/telescope-live-grep-args.nvim',
        }
      }
}
