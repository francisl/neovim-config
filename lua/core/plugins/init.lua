local vim = vim or {}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lazy-deps directory
local plugin_files = {
    "lazy-deps/themes",
    "lazy-deps/snacks",
    -- use snacks instead "lazy-deps/nvim-tree",
    -- "lazy-deps/telescope",
    "lazy-deps/completion",
    "lazy-deps/lsp",
    "lazy-deps/misc",
    "lazy-deps/avante",
    "lazy-deps/todo-comments",
}

local plugins = {}
for _, file in ipairs(plugin_files) do
    local ok, plugin_group = pcall(require, "core/plugins/" .. file)
    if ok and type(plugin_group) == "table" then
        for _, plugin in ipairs(plugin_group) do
            table.insert(plugins, plugin)
        end
    else
        vim.notify("Error loading plugin group: " .. file, vim.log.levels.ERROR)
    end
end

-- Setup lazy.nvim with plugins
require("lazy").setup(plugins, {
    change_detection = {
        notify = false, -- Set to false to not get notifications when changes are found
    },
    performance = {
        rtp = {
            reset = false,
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- Load plugin configurations using a more consistent approach
local configs = {
    "lualine",
    "mason",
    "completions",
    "lsp",
    -- "telescope",
    -- "nvim-tree",
    "treesitter",
    "harpoon",
    "git",
    "copilot",
    "swift",
    "oil",
    "templ",
    "tmux",
    "which-key",
}

for _, config in ipairs(configs) do
    local ok, err = pcall(require, "core/plugins/config." .. config)
    if not ok then
        vim.notify("Error loading plugin config: " .. config .. "\n" .. err, vim.log.levels.ERROR)
    end
end

-- Load go plugin separately since it has its own setup call
pcall(function() require('go').setup() end)
