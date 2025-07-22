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
    "lazy-deps/misc",
    "lazy-deps/snacks",
    "lazy-deps/ai",
    "lazy-deps/completion",
    "lazy-deps/lsp",
    "lazy-deps/codecompanion",
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

-- vim.notify("Plugins loaded" .. vim.inspect(plugins))

-- Setup lazy.nvim with plugins
require("lazy").setup(plugins, {
    defaults = {
        version = "*", -- Try to use the latest git commit
    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { 
        enabled = true,
        notify = false, -- Don't notify about updates
        frequency = 3600 * 24, -- Check once per day
    },
    change_detection = {
        notify = false,
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}) 