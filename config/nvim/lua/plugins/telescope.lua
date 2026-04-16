return {
  {
    "https://github.com/nvim-telescope/telescope.nvim",
    version = "^0.2.0",
    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim.git",
      {
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local telescopeConfig = require("telescope.config")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
          winblend = 10,
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension('fzf')

      vim.keymap.set('n', '<leader><leader>', function()
        builtin.find_files(themes.get_dropdown({ width = 0.5, prompt = " ", results_height = 15, previewer = false }))
      end, { desc = "Find Files Quickly" })
      vim.keymap.set('n', '<leader>ff', function()
        builtin.git_files({
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", preview_width = 0.5 },
        })
      end, { desc = "Find Git Files" })
      vim.keymap.set('n', '<leader>fF', function()
        builtin.find_files({
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", preview_width = 0.5 },
        })
      end, { desc = "Find Files(ALL)" })
      -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep({
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", preview_width = 0.5 },
        })
      end, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb', function()
        builtin.buffers({
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", preview_width = 0.5 },
        })
      end, { desc = "Buffers" })
    end
  },
}
