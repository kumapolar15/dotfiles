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
      local helpers = require("incline.helpers")
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
            local errorCount = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity["Error"] })
            if errorCount > 0 then
              return { filename, group = "DiagnosticSignError" }
            end
            local warnCount = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity["Warn"] })
            if warnCount > 0 then
              return { filename, group = "DiagnosticSignWarn" }
            end
          end

          return {
            " ",
            { get_diagnostic_label() },
            { (ft_icon or "") .. " ", guifg = ft_color },
            { filename .. " ", gui = "bold" },
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
    },
    config = function()
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
      })
    end
  },
  {
    "https://github.com/rcarriga/nvim-notify.git",
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
}
