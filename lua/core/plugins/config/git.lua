-- GIT PLUGIN

-- git sign
--

-- Fugitive
vim.keymap.set("n", "<leader>Gs", vim.cmd.Git, { desc = "Git status" })

local Fl_Fugitive = vim.api.nvim_create_augroup("Fl_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Fl_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>pu", function()
            vim.cmd.Git('push')
        end, vim.tbl_extend("force", opts, { desc = "Git push" }))

        -- rebase always
        vim.keymap.set("n", "<leader>Grb", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, vim.tbl_extend("force", opts, { desc = "Git pull --rebase" }))

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>Gpo", ":Git push -u origin ",
            vim.tbl_extend("force", opts, { desc = "Git push origin" }))
    end,
})
