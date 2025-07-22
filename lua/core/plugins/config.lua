local vim = vim or {}

-- List of plugin configurations to load
local configs = {
    "lualine",
    "mason",
    "completions",
    "ionide",
    "lsp",
    "treesitter",
    "harpoon",
    "git",
    "ai",
    "swift",
    "oil",
    -- "templ",
    "tmux",
    "codecompanion",
}

-- Defer loading of plugin configs
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        for _, config in ipairs(configs) do
            local ok, result = pcall(require, "core/plugins/config-deps/" .. config)
            if ok then
                -- vim.notify("Loading plugin config: " .. config)
            else
                vim.notify("Error loading plugin config: " .. config .. "\n" .. result, vim.log.levels.ERROR)
            end
        end
        
        -- Load go plugin separately since it has its own setup call
        pcall(function() require('go').setup() end)
    end,
}) 
