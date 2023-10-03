local nvim_lsp = require('lspconfig')

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

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

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
    'tsserver',
  },
  automatic_installation = false,
  handlers = nil,
})
mason_lsp.setup_handlers({
  function (server_name)
    nvim_lsp[server_name].setup({
      capabilities = capabilities
    })
  end
})

