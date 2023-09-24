vim.o.termguicolors = true
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


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

local day = "day"
local night = "night"
local themeAppearance = day
local themes = { day = "dayfox", night = "terafox" }

local themeDaytime = function()
  local hr = tonumber(os.date('%H', os.time()))
  if hr > 7 and hr < 15 then -- day between 7am and 3pm
    themeAppearance = day
    vim.cmd("colorscheme " .. themes.day)
  else -- night
    themeAppearance = night
    vim.cmd("colorscheme " .. themes.night)
  end
end

local themeToggle = function()
  if themeAppearance == day then
    vim.cmd("colorscheme " .. themes.night)
    themeAppearance = night
  else
    vim.cmd("colorscheme " .. themes.day)
    themeAppearance = day
  end
end

themeDaytime()

vim.api.nvim_create_user_command(
  'ThemeDaytime',
  themeDaytime,
  {}
)

vim.api.nvim_create_user_command(
  'ThemeToggle',
  themeToggle,
  {}
)
