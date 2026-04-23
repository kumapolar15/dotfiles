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
  {
    "https://github.com/rest-nvim/rest.nvim.git",
    dependencies = {
      "https://github.com/j-hui/fidget.nvim.git",
      "https://github.com/nvim-neotest/nvim-nio.git",
      {
        -- Lazy.nvim does not recognize this library's rocksfile, so add it
        -- to package path manually.
        "https://github.com/manoelcampos/xml2lua.git",
        config = function (plugin)
          package.path = package.path .. ";" .. plugin.dir .. "/?.lua"
        end,
      },
      "https://github.com/lunarmodules/lua-mimetypes.git",
      {
        "https://github.com/nvim-treesitter/nvim-treesitter.git",
        opts = function (_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "http")
        end,
      },
    },
    ft = "http",
    build = false,
    config = function ()
      vim.g.rest_nvim = {
        request = {
          skip_ssl_verification = true,
        },
      }
    end
  },
}

