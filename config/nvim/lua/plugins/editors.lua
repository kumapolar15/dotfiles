return {
  {
    "https://github.com/cohama/lexima.vim.git",
    event = "InsertEnter",
  },
  {
    "https://github.com/kylechui/nvim-surround.git",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },
  {
    "https://github.com/numToStr/Comment.nvim.git",
    dependencies = {
      {
        "https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git",
        opts = {
          enable_autocmd = false,
        },
      },
    },
    keys = {
      { "gc", mode = { "n", "x" } },
      { "gb", mode = { "n", "x" } },
      { "gcc", mode = "n" },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "https://github.com/monaqa/dial.nvim.git",
    lazy = true,
    keys = {
      {
        "<C-a>", function()
          require("dial.map").manipulate("increment", "normal")
        end, mode = "n",
      },
      {
        "<C-x>", function()
          require("dial.map").manipulate("decrement", "normal")
        end, mode = "n",
      },
      {
        "g<C-a>", function()
          require("dial.map").manipulate("increment", "gnormal")
        end, mode = "n",
      },
      {
        "g<C-x>", function()
          require("dial.map").manipulate("decrement", "gnormal")
        end, mode = "n",
      },
      {
        "<C-a>", function()
          require("dial.map").manipulate("increment", "visual")
        end, mode = "x",
      },
      {
        "<C-x>", function()
          require("dial.map").manipulate("decrement", "visual")
        end, mode = "x",
      },
      {
        "g<C-a>", function()
          require("dial.map").manipulate("increment", "gvisual")
        end, mode = "x",
      },
      {
        "g<C-x>", function()
          require("dial.map").manipulate("decrement", "gvisual")
        end, mode = "x",
      },
    },
  },
}
