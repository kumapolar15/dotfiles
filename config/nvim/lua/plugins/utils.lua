return {
  {
    "https://github.com/dstein64/vim-startuptime.git",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
      vim.g.startuptime_exe_args = { "--headless" }
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
  },
  {
    "https://github.com/tpope/vim-eunuch.git",
    cmd = {
      "Remove",
      "Delete",
      "Move",
      "Rename",
      "Copy",
      "Duplicate",
      "Chmod",
      "Mkdir",
      "Cfind",
      "Clocate",
      "Lfind",
      "Llocate",
      "Wall",
      "SudoWrite",
      "SudoEdit",
    },
  },
  {
    "https://github.com/akinsho/toggleterm.nvim.git",
    cmd = { "ToggleTerm" },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
      { "<C-¥>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
    },
    opts = {
      open_mapping = { [[<c-\>]], [[<c-¥>]] },
      direction = "horizontal",
      size = 20,
    },
  },
}

