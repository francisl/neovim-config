local vim = vim or {}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lazy-deps directory
local plugin_files = {
    "lazy-deps/themes",
    "lazy-deps/snacks",
    "lazy-deps/ai",
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
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
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
    "treesitter",
    "harpoon",
    "git",
    "ai",
    "swift",
    "oil",
    "templ",
    "tmux",
    "which-key",
    "avante",
}

for _, config in ipairs(configs) do
    local ok, err = pcall(require, "core/plugins/config." .. config)
    if not ok then
        vim.notify("Error loading plugin config: " .. config .. "\n" .. err, vim.log.levels.ERROR)
    end
end

-- Load go plugin separately since it has its own setup call
pcall(function() require('go').setup() end)
