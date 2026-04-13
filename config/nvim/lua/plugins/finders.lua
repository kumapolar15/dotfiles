return {
  {
    'https://github.com/stevearc/oil.nvim.git',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons.git" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", mode = "n", desc = "Oil current buffer's directory" },
      { "<leader>E", "<cmd>Oil .<cr>", mode = "n", desc = "Oil ." },
    },
  }
}

