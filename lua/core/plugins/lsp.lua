require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require('lspsaga').setup({
--   symbol_in_winbar = {
--     in_custom = false,
--     enable = true,
--     separator = ' ',
--     show_file = true,
--     file_formatter = ""
--   },
-- })

-- vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
-- vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
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

-- Ocaml
--
--
--local on_attach = function(client, bufnr)
--  if client.server_capabilities.documentFormattingProvider then
--      vim.api.nvim_create_autocmd("BufWritePre", {
--          group = vim.api.nvim_create_augroup("Format", { clear = true }),
--          buffer = bufnr,
--          callback = function() vim.lsp.buf.formatting_seq_sync() end
--      })
--  end
--end

nvim_lsp.ocamllsp.setup {}


-- Go lang
--
require('go').setup {
  lsp_cfg = false
}
local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup
nvim_lsp.gopls.setup(cfg)

-- TypeScript
nvim_lsp.tsserver.setup {
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
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    bufmap('n', 'gdd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gds', '<cmd>lua vim.lsp.buf.definition({jump_type="vsplit"})<cr>')

    bufmap('n', 'gDD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gDs', '<cmd>lua vim.lsp.buf.declaration({jump_type="vsplit"})<cr>')

    -- Use formater
    bufmap("n", "gf", '<cmd>lua vim.lsp.buf.formatting<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gu', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

    bufmap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
  end
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

local lspconfig = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { 'gopls', 'ccls', 'cmake', 'tsserver', 'templ' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
vim.filetype.add({ extension = { templ = "templ" } })



lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})


