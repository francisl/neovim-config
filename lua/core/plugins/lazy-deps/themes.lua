return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false,  -- We want the colorscheme to load immediately
        priority = 1000,  -- Load before other plugins
        config = function()
            require('nightfox').setup({
                options = {
                    -- Compile the theme for faster loading
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled",
                }
            })
        end,
    },
    -- 'bluz71/vim-nightfly-colors',
}
