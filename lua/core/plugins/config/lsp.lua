require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--
local nvim_lsp = require("lspconfig")

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

vim.api.nvim_create_user_command('LoadSourcekitLSP', function()
  nvim_lsp.sourcekit.setup {
    cmd = { '/usr/bin/sourcekit-lsp' }
  }
end, {})

-- Go lang
--
require('go').setup {
  lsp_cfg = false
}
local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup
nvim_lsp.gopls.setup(cfg)

-- TypeScript
nvim_lsp["ts_ls"].setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
}


vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local map = function(mode, keys, func, desc)
      local description = desc ~= nil and desc or ''
      local opts = { buffer = true, desc = 'LSP: ' .. (description or '') }
      vim.keymap.set(mode, keys, func, opts)
    end


    -- Use leader for common navigation/lookup actions
    map('n', '<leader>ch', '<cmd>Lspsaga signature_help<CR>', 'Signature help')
    -- Displays hover information about the symbol under the cursor
    map('n', '<leader>ck', '<cmd>Lspsaga hover_doc<CR>', 'Hover documentation')

    -- Renames all references to the symbol under the cursor
    map('n', '<leader>cn', '<cmd>Lspsaga rename<CR>', 'Rename symbol')

    -- Code actions
    -- map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code action')
    map('x', '<leader>ca', '<cmd>Lspsaga range_code_action<CR>', 'Range code action')

    -- Diagnostics
    map('n', '<leader>cel', '<cmd>Lspsaga show_line_diagnostics<CR>', 'Show diagnostic details')
    map('n', '<leader>cep', '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Previous diagnostic')
    map('n', '<leader>cen', '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Next diagnostic')

    -- Formatting
    map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, 'Format document')
  end
})

local lspconfig = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { 'ccls', 'cmake', 'ts_ls', 'templ' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
  })
end
vim.filetype.add({ extension = { templ = "templ" } })

lspconfig.html.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})


-- Saga
--
vim.keymap.set('n','<leader>`', '<cmd>Lspsaga term_toggle<CR>', {desc = "Toggle terminal"})


