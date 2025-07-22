return {{
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = {"InsertEnter", "BufReadPre", "BufNewFile"},
    dependencies = {"zbirenbaum/copilot-cmp"},
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = true,
                layout = {
                  position = "right",
                  ratio = 0.4
                }
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                debounce = 75,
                trigger_on_accept = true,
                keymap = {
                    accept = "<C-Space>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>"
                }
            },
            filetypes = {
                markdown = true,
                help = true
            }
        })
    end
}, {
    "zbirenbaum/copilot-cmp",
    config = function()
        require("copilot_cmp").setup()
    end
}}
