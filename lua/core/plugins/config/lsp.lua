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

    local builtin = require('telescope.builtin')


    -- Use leader for common navigation/lookup actions
    map('n', '<leader>gd', builtin.lsp_definitions, 'Go to definition')
    map('n', '<leader>gi', builtin.lsp_implementations, 'Go to implementation')
    map('n', '<leader>gc', '<cmd>Lspsaga goto_definition<CR>', 'Go to declaration')
    map('n', '<leader>gs', builtin.lsp_document_symbols, 'Document symbols')
    map('n', '<leader>gw', builtin.lsp_dynamic_workspace_symbols, 'Workspace symbols')
    map('n', '<leader>gt', '<cmd>Lspsaga goto_type_definition<CR>', 'Go to type definition')
    map('n', '<leader>gr', builtin.lsp_references, 'Go to references')

    -- Function signature information
    map('n', '<leader>sh', '<cmd>Lspsaga signature_help<CR>', 'Signature help')
    -- Displays hover information about the symbol under the cursor
    map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', 'Hover documentation')

    -- Renames all references to the symbol under the cursor
    map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', 'Rename symbol')

    -- Code actions
    -- map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>ga', '<cmd>Lspsaga code_action<CR>', 'Code action')
    map('x', '<leader>ga', '<cmd>Lspsaga range_code_action<CR>', 'Range code action')

    -- Diagnostics
    map('n', '<leader>di', '<cmd>Lspsaga show_line_diagnostics<CR>', 'Show diagnostic details')
    map('n', '<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Previous diagnostic')
    map('n', '<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Next diagnostic')

    -- Formatting
    map('n', '<leader>gm', function() vim.lsp.buf.format({ async = true }) end, 'Format document')
  end
})

local lspconfig = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { 'gopls', 'ccls', 'cmake', 'ts_ls', 'templ' }
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


