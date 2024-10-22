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

nvim_lsp.sourcekit.setup{
  cmd = {'/usr/bin/sourcekit-lsp'}
}

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

-- Nim
nvim_lsp.nimls.setup {
  cmd = { "nimlsp" }
}
nvim_lsp.eslint.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local map = function(mode, keys, func, desc)
      local description = desc ~= nil and desc or ''
      local opts = { buffer = true, desc = 'LSP: ' .. (description or '') }
      vim.keymap.set(mode, keys, func, opts)
    end

    local builtin = require('telescope.builtin')
    -- Displays hover information about the symbol under the cursor
    map('n', 'K', vim.lsp.buf.hover)
    map('n', 'gd', builtin.lsp_definitions)
    map('n', 'gI', builtin.lsp_implementations)
    map('n', 'gdc', vim.lsp.buf.declaration)
    map('n', 'gds', builtin.lsp_document_symbols)
    map('n', 'gws', builtin.lsp_dynamic_workspace_symbols)

    -- Use formater
    -- map("n", "gf", vim.lsp.buf.formatting)
    map('n', 'gt', vim.lsp.buf.type_definition)
    map('n', 'gr', vim.lsp.buf.references)
    -- Displays a function's signature information
    map('n', 'gs', vim.lsp.buf.signature_help)
    -- Renames all references to the symbol under the cursor
    map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
    -- Selects a code action available at the current cursor position
    map('n', '<leader>ca', vim.lsp.buf.code_action)
    map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    -- Show diagnostics in a floating window
    map('n', 'gl', vim.diagnostic.open_float)
    map('n', '[d', vim.diagnostic.goto_prev)  -- Move to the previous diagnostic
    map('n', ']d', vim.diagnostic.goto_next)  -- Move to the next diagnostic
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
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


