local status, nvim_lsp = pcall(require, 'lspconfig')

local on_attach = function(client, bufnr)
  local set = vim.keymap.set
  local s, lspsaga = pcall(require, 'lspsaga')
  if (s) then
    set('n', 'gr', '<cmd>Lspsaga finder<CR>')
    set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
    set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    set('n', 'gn', '<cmd>Lspsaga rename<CR>')
    set('n', 'ga', '<cmd>Lspsaga code_action<CR>')
    set('n', 'ge', '<cmd>Lspsaga show_line_diagnostics<CR>')
    set('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
    set('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
  else
    set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    set('n', '<C-m>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    set('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    set('n', 'rn', '<cmd>lua vim.lsp.rename()<CR>')
    set('n', 'ma', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    set('n', 'gr', '<cmd>lua vim.lsp.buf.references<CR>')
    set('n', '', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    set('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    set('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  end
end

local protocol = require('vim.lsp.protocol')
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

local status, mason = pcall(require, 'mason')
local status, mason_lsp = pcall(require, 'mason-lspconfig')

mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    }
  }
})
mason_lsp.setup({
  ensure_installed = {
    'lua_ls',
    'intelephense',
    'tyserver',
  },
  automatic_installation = false,
  handlers = nil,
})
mason_lsp.setup_handlers({
  function (server_name)
    nvim_lsp[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
})

