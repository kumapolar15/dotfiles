return {

  -- iceberg
  {
    "https://github.com/cocopon/iceberg.vim.git",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "iceberg",
        callback = function()
          -- Iceberg highlights for external plugins
          vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
        end,
      })
      vim.cmd([[colorscheme iceberg]])
    end,
  },
}

