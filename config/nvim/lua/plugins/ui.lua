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
  {
    "https://github.com/b0o/incline.nvim.git",
    dependencies = {
      "https://github.com/nvim-tree/nvim-web-devicons.git",
    },
    event = "VeryLazy",
    config = function()
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          margin = {
            horizontal = 0,
            vertical = 1,
          },
          padding = 0,
          placement = {
            horizontal = "right",
            vertical = "bottom",
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local readonly = vim.bo[props.buf].readonly
          local modified = vim.bo[props.buf].modified

          local get_diagnostic_label = function()
            local icons = { error = '', warn = '', info = '', hint = '' }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "┊ " })
            end
            return label
          end

          local get_filename_label = function()
            local errorCount = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity["ERROR"] })
            if errorCount > 0 then
              return { filename .. " ", group = "DiagnosticSignError", gui = "bold" }
            end
            local warnCount = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity["WARN"] })
            if warnCount > 0 then
              return { filename .. " ", group = "DiagnosticSignWarn", gui = "bold" }
            end
            return { filename .. " ", gui = "bold" }
          end

          return {
            " ",
            { get_diagnostic_label() },
            { (ft_icon or "") .. " ", guifg = ft_color },
            { get_filename_label() },
            { (readonly and "" or "") },
            { (modified and "" or "") .. " ", group = "Title" },
            group = "Visual",
          }
        end,
      })
    end,
  },
  {
    "https://github.com/nvim-lualine/lualine.nvim.git",
    dependencies = {
      "https://github.com/nvim-tree/nvim-web-devicons.git",
      "https://github.com/SmiteshP/nvim-navic.git",
    },
    config = function()
      local navic = require("nvim-navic")

      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = '', right = '┊' },
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {},
          lualine_x = { "encoding", "fileformat", { "filetype", colored = false } },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        winbar = {
          lualine_c = {
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end,
            },
          },
        },
      })
    end
  },
  {
    "https://github.com/rcarriga/nvim-notify.git",
    event = "VeryLazy",
    opts = {
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "",
        WARN = "",
      },
      render = "default",
      stages = "fade",
    },
  },
  {
    "https://github.com/folke/noice.nvim.git",
    dependencies = {
      "https://github.com/MunifTanjim/nui.nvim.git",
      "https://github.com/rcarriga/nvim-notify.git",
    },
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
      },
    },
  },
  {
    "https://github.com/andersevenrud/nvim_context_vt.git",
    event = "VeryLazy",
    opts = {
      enabled = true,
      prefix = "",
    },
  },
  {
    "https://github.com/shellraining/hlchunk.nvim.git",
    event = "VeryLazy",
    config = function()
      local chunkColorNormal = vim.api.nvim_get_hl(0, { name = "Constant" })
      local chunkColorError = vim.api.nvim_get_hl(0, { name = "ErrorMsg" })
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = {
            { fg = chunkColorNormal.fg },
            { fg = chunkColorError.fg },
          },
        },
      })
    end
  },
  {
    "https://github.com/j-hui/fidget.nvim.git",
    opts = {},
  },
  {
    "https://github.com/SmiteshP/nvim-navic.git",
    dependencies = {
      "https://github.com/neovim/nvim-lspconfig.git",
    },
    opts = {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      },
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = false, -- TODO: Enable this after defining Iceberg-themed highlights.
      separator = " > ",
      depth_limit = 9,
    },
  },
}
