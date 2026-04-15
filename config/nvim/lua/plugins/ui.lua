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
}
