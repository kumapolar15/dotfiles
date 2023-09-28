-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.bo.fileencoding = 'utf-8'
vim.go.fileencoding = 'utf-8'

-- file
vim.o.wildignore = '*/node_modules/*,*/vendor/*'
vim.bo.autoread = true
vim.go.autoread = true

-- buckup
vim.o.backup = false
vim.o.writebackup = true
vim.o.backupskip = '/tmp/*,/private/tmp*'

-- buffer
vim.o.hidden = true

-- workspace view
vim.o.title = true
vim.o.laststatus = 3
vim.o.scrolloff = 10
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'yes'
vim.wo.wrap = true
vim.bo.wrapmargin = 2
vim.go.wrapmargin = 2
vim.wo.breakindent = true
vim.wo.list = true
vim.o.listchars = "tab:▸-"

-- edit
vim.o.backspace = 'indent,eol,start'
vim.o.virtualedit = 'onemore'

-- search
vim.o.hlsearch = true
vim.o.inccommand = true
vim.o.wrapscan = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- shell
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.shell = 'zsh'
vim.o.shellcmdflag = '-c'

-- indent
vim.o.smarttab = true
vim.bo.autoindent = true
vim.go.autoindent = true
vim.bo.smartindent = true
vim.go.smartindent = true
vim.bo.expandtab = true
vim.go.expandtab = true
vim.bo.tabstop = 4
vim.go.tabstop = 4
vim.bo.softtabstop = -1
vim.go.softtabstop = -1
vim.bo.shiftwidth = 0
vim.go.shiftwidth = 0
vim.api.nvim_create_augroup('fileTypeIndent', {})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = 'fileTypeIndent',
  pattern = {'*.sh', '*.java', '*.php', '*.md'},
  callback = function()
    if (vim.g.filetype_indent) then
      vim.bo.tabstop = 4
      vim.bo.expandtab = true
    end
  end,
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = 'fileTypeIndent',
  pattern = {'*.lua', '*.js', '*.ts', '*.git'},
  callback = function()
    if (vim.g.filetype_indent) then
      vim.bo.tabstop = 2
      vim.bo.expandtab = true
    end
  end,
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  group = 'fileTypeIndent',
  pattern = {'*.toml', 'Makefile'},
  callback = function()
    if (vim.g.filetype_indent) then
      vim.bo.tabstop = 2
      vim.bo.expandtab = false
    end
  end,
})

-- help
vim.o.helplang = 'ja,en'

-- visual beep
vim.o.visualbell = true

-- clipboard
vim.o.clipboard = 'unnamedplus'

-- Turn off paste mode when left insert mode
vim.api.nvim_create_autocmd('insertLeave', {
    pattern = '*',
    command = 'set nopaste'
})

-- global value
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.filetype_indent = true
