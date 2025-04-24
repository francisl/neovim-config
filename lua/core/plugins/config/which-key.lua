local wk = require("which-key")

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
