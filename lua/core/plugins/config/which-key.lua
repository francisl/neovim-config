local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  window = {
    border = "none",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
})

-- Register leader key groups
wk.add({
  { "<leader>i", group = "AI" },
  { "<leader>b", group = "Buffer" },
  { "<leader>c", group = "Code" },
  { "<leader>ce", group = "Code Errors" },
  { "<leader>e", group = "Edit", icon = "" },
  { "<leader>f", group = "Files" },
  { "<leader>g", group = "Git" },
  { "<leader>ga", group = "Git Actions" },
  { "<leader>h", group = "Harpoon" },
  { "<leader>s", group = "Snacks", icon = "󰉚 "},
  { "<leader>u", group = "UI Toggle" },
  { "<leader>ut", group = "UI Theme" },
  { "<leader>w", group = "Window" },
  { "<leader>ws", group = "Window Split" },
  { "<leader>wt", group = "Window Tabs" },
  { "<leader>/", group = "Search" },
})
