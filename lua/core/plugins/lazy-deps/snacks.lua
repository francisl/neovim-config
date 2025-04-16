return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { 
          enabled = true,
          replace_netrw = true, -- Replace netrw with the snacks explorer
        },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        toggle = { enabled = true },
        words = { enabled = true },
      },
    },
    keys = {
    { "<leader>sd", function() Snacks.dashboard() end, desc = "Dashboard" },
      -- Top Pickers & Explorer
    { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>//", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>e:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gi", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gw", function() Snacks.gitbrowse() end, desc = "Git Web Browser" },
    -- Grep
    { "<leader>/l", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>/b", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>/w", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>/r"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>/h', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>/a", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>/b", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>/c", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>/C", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>/?", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>/H", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>/i", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>/j", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>/k", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>/L", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>/m", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>/M", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>/p", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>/q", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>/R", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>/u", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>/C", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "<leader>cd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "<leader>cD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "<leader>cr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>ci", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>ct", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>cs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>cea", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>ceb", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
            "<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  }
}
