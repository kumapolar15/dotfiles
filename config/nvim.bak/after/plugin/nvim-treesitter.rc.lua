local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup({
  ensure_installed = {
    'markdown',
    'markdown_inline',
    'tsx',
    'typescript',
    'toml',
    'php',
    'html',
    'yaml',
    'lua',
    'json',
    'css',
    'javascript',
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
})
