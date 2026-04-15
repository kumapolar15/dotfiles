return {
  {
    "https://github.com/folke/which-key.nvim.git",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "https://github.com/nacro90/numb.nvim.git",
    event = "VeryLazy",
    opts = {},
  },
  {
    "https://github.com/uga-rosa/ccc.nvim.git",
    event = "VeryLazy",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    "https://github.com/MeanderingProgrammer/render-markdown.nvim.git",
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter.git",
      "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    opts = {},
  },
}
