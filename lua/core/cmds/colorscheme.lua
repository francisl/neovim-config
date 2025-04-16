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

local function get_os_dark_mode()
  local os_name = vim.loop.os_uname().sysname

  if os_name == "Darwin" then
    -- macOS: Use `osascript` to check dark mode
    local handle = io.popen(
    'osascript -e "tell application \\"System Events\\" to tell appearance preferences to get dark mode"')
    if handle then
      local result = handle:read("*a")
      handle:close()
      return result:match("true") ~= nil
    end
  elseif os_name == "Linux" then
    -- Linux (GNOME): Use `gsettings` to check dark mode
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    if handle then
      local result = handle:read("*a")
      handle:close()
      return result:match("dark") ~= nil
    end
  elseif os_name == "Windows_NT" then
    -- Windows: Use PowerShell command to check dark mode
    local handle = io.popen(
      'powershell.exe -Command "[System.Console]::WriteLine((Get-ItemProperty -Path HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize).AppsUseLightTheme -eq 0)"'
    )
    if handle then
      local result = handle:read("*a")
      handle:close()
      return result:match("True") ~= nil
    end

  end
  -- Default to light mode if detection fails
  return false
end

local apply_theme = function(appearance, use_transparency)
  use_transparency = use_transparency == nil and true or use_transparency
  
  -- First clear any existing highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Apply the new colorscheme
  vim.cmd("colorscheme " .. themes[appearance])
  
  -- Only apply transparency for dark themes
  if use_transparency and appearance == dark then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
  
  -- Force a redraw to ensure all colors are applied
  vim.cmd("redraw!")
end

local sync_theme = function()
  invertAppearance = false
  if get_os_dark_mode() then
    apply_theme(dark)
  else
    apply_theme(light)
  end
end

local theme_toggle = function()
  local isDark = get_os_dark_mode()

  if not invertAppearance then
    local nextAppearance = isDark and light or dark
    invertAppearance = true
    apply_theme(nextAppearance, false)
  else
    sync_theme()
  end
end

-- Update background on startup
sync_theme()

-- Optionally re-check on focus gain
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = sync_theme
})

vim.api.nvim_create_user_command(
  'ColorschemeSync',
  sync_theme,
  {}
)

vim.api.nvim_create_user_command(
  'ColorschemeToggle',
  theme_toggle,
  {}
)

vim.api.nvim_create_user_command(
  'ColorschemeReset',
  function()
    theme_toggle(); theme_toggle()
  end,
  {}
)

vim.keymap.set("n", "<leader>utt", ":colorschemeToggle<cr>", { desc = "Toggle Theme" })
vim.keymap.set("n", "<leader>utr", ":colorschemeReset<cr>", { desc = "Reset Theme" })
vim.keymap.set("n", "<leader>uts", ":colorschemeSync<cr>", { desc = "Sync Theme" })