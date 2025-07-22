vim.o.termguicolors = true

-- install the themes:
-- local plugins = {
--   'ellisonleao/gruvbox.nvim',
--   'rebelot/kanagawa.nvim',
--   'mhartington/oceanic-next',
--   'EdenEast/nightfox.nvim',

-- vim.cmd [[ colorscheme kanagawa ]]
-- vim.cmd [[ colorscheme OceanicNext ]]
-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme dawnfox")
-- vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme nordfox")
-- vim.cmd("colorscheme terafox")
-- vim.cmd("colorscheme carbonfox")

-- Light themes
-- vim.cmd("colorscheme delek")

local light = "light"
local dark = "dark"
local invertAppearance = false
local themes = { light = "dayfox", dark = "slate" }

-- Cache the OS check result and add a timeout
local cached_os_dark_mode = nil
local last_check_time = 0
local check_interval = 1000 -- Check every 1 second

local function get_os_dark_mode()
  local current_time = vim.loop.now()
  if cached_os_dark_mode ~= nil and (current_time - last_check_time) < check_interval then
    return cached_os_dark_mode
  end

  local os_name = vim.loop.os_uname().sysname
  local is_dark = false

  if os_name == "Darwin" then
    local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
    if handle then
      local result = handle:read("*a")
      handle:close()
      is_dark = result:match("Dark") ~= nil
    end
  elseif os_name == "Linux" then
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    if handle then
      local result = handle:read("*a")
      handle:close()
      is_dark = result:match("dark") ~= nil
    end
  elseif os_name == "Windows_NT" then
    local handle = io.popen('powershell.exe -Command "[System.Console]::WriteLine((Get-ItemProperty -Path HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize).AppsUseLightTheme -eq 0)"')
    if handle then
      local result = handle:read("*a")
      handle:close()
      is_dark = result:match("True") ~= nil
    end
  end

  cached_os_dark_mode = is_dark
  last_check_time = current_time
  return is_dark
end

-- Cache the highlight groups
local cached_highlights = {}

local function apply_theme(appearance, use_transparency)
  use_transparency = use_transparency == nil and true or use_transparency
  
  -- Check if we're already using this theme
  if vim.g.colors_name == themes[appearance] then
    return
  end
  
  -- Use vim.cmd.colorscheme for better performance
  vim.cmd.colorscheme(themes[appearance])
  
  if use_transparency and appearance == dark then
    -- Cache and reuse highlight groups
    if not cached_highlights[appearance] then
      cached_highlights[appearance] = {
        normal = vim.api.nvim_get_hl(0, { name = "Normal" }),
        float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
      }
      cached_highlights[appearance].normal.bg = "NONE"
      cached_highlights[appearance].float.bg = "NONE"
    end
    
    vim.api.nvim_set_hl(0, "Normal", cached_highlights[appearance].normal)
    vim.api.nvim_set_hl(0, "NormalFloat", cached_highlights[appearance].float)
  end
end

local function sync_theme()
  invertAppearance = false
  apply_theme(get_os_dark_mode() and dark or light)
end

local function theme_toggle()
  local isDark = get_os_dark_mode()

  if not invertAppearance then
    local nextAppearance = isDark and light or dark
    invertAppearance = true
    apply_theme(nextAppearance, false)
  else
    sync_theme()
  end
end

-- Defer initial theme application to after startup
vim.schedule(function()
  sync_theme()
end)

-- Create autocommands and commands in a single batch
local theme_group = vim.api.nvim_create_augroup("ThemeSync", { clear = true })
vim.api.nvim_create_autocmd("FocusGained", {
  group = theme_group,
  pattern = "*",
  callback = sync_theme
})

-- Create user commands
local commands = {
  ColorschemeSync = sync_theme,
  ColorschemeToggle = theme_toggle,
  ColorschemeReset = function() theme_toggle(); theme_toggle() end
}

for name, func in pairs(commands) do
  vim.api.nvim_create_user_command(name, func, {})
end

-- Create keymaps in a single batch
local keymaps = {
  { "<leader>utt", ":ColorschemeToggle<cr>", desc = "Toggle Theme" },
  { "<leader>utr", ":ColorschemeReset<cr>", desc = "Reset Theme" },
  { "<leader>uts", ":ColorschemeSync<cr>", desc = "Sync Theme" }
}

for _, map in ipairs(keymaps) do
  vim.keymap.set("n", map[1], map[2], { desc = map.desc })
end