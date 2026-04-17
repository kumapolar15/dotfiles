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
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y年%-m月%-d日"],
          augend.date.alias["%Y年%-m月%-d日(%ja)"],
          augend.date.alias["%H:%M:%S"],
          augend.date.alias["%H:%M"],
          augend.constant.alias.en_weekday,
          augend.constant.alias.en_weekday_full,
          augend.constant.alias.ja_weekday,
          augend.constant.alias.ja_weekday_full,
          augend.constant.alias.bool,
          augend.constant.alias.Bool,
          augend.constant.new({
            elements = { "and", "or" },
            word = true,
            cyclic = true,
          }),
          augend.constant.new({
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          }),
        },
      })
    end,
  },
  {
    "https://github.com/wansmer/treesj.git",
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter.git",
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      use_default_keymaps = false,
    },
  },
}
