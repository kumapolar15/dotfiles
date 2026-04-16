return {
  {
    "https://github.com/dstein64/vim-startuptime.git",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "https://github.com/tpope/vim-fugitive.git",
    cmd = {
      "Git",
      "G",
      "Gedit",
      "Gsplit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
    },
    opts = {},
  },
}

