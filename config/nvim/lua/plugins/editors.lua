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
      ---@diagnostic disable-next-line: missing-fields
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
    keys = {
      { "<S-j>", function()
        require("treesj").toggle()
      end, desc = "TSJToggle"},
    },
    opts = {
      use_default_keymaps = false,
    },
  },
  {
    "https://github.com/hrsh7th/nvim-cmp.git",
    dependencies = {
      -- Snipets
      {
        "https://github.com/L3MON4D3/LuaSnip.git",
        dependencies = {
          "https://github.com/rafamadriz/friendly-snippets.git",
        },
        build = "make install_jsregexp",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      "https://github.com/saadparwaiz1/cmp_luasnip.git",
      -- Buffer, Vim-fuiltin functionality
      "https://github.com/hrsh7th/cmp-buffer.git",
      "https://github.com/hrsh7th/cmp-calc.git",
      -- LSP
      "https://github.com/neovim/nvim-lspconfig.git",
      "https://github.com/hrsh7th/cmp-nvim-lsp.git",
      "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help.git",
      -- Filesystem paths
      "https://github.com/hrsh7th/cmp-path.git",
      -- Command line
      "https://github.com/hrsh7th/cmp-cmdline.git",
      -- Icons, Symbols, and Emojis
      "https://github.com/hrsh7th/cmp-emoji.git",
      "https://github.com/chrisgrieser/cmp-nerdfont.git",
    },
    event = "VeryLazy",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      cmp.setup({
        formatting = {
          fields = { 'abbr', 'icon', 'kind', 'menu'},
          format = lspkind.cmp_format({
            preset = "codicons",
            symbol_map = { Copilot = "" },
            maxwidth = { abbr = 50, menu = 50 },
            ellipsis_char = '...',
            show_labelDetails = true,
            before = function (_, vim_item)
              return vim_item
            end
          })
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.config.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end),
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "calc" },
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "emoji" },
          { name = "nerdfont" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = {
          disallow_fuzzy_matching = false,
          disallow_fullfuzzy_matching = false,
          disallow_partial_fuzzy_matching = true,
          disallow_partial_matching = false,
          disallow_prefix_unmatching = false,
          disallow_symbol_nonprefix_matching = true,
        },
      })
    end,
  },
  {
    "https://github.com/onsails/lspkind.nvim.git",
    lazy = true,
  },
  {
    "https://github.com/zbirenbaum/copilot.lua.git",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function ()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "https://github.com/zbirenbaum/copilot-cmp.git",
    event = { "InsertEnter", "LspAttach" },
    config = function ()
      require("copilot_cmp").setup({
        fix_pairs = true,
      })
    end,
  },
}
