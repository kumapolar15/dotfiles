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
          vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#2a3158" })
          vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#2a3158" })
          vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#2a3158" })
          vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#2a3158" })
          vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#2a3158" })
          vim.api.nvim_set_hl(0, "NotifyERRORIcon", { link = "ErrorMsg" })
          vim.api.nvim_set_hl(0, "NotifyWARNIcon", { link = "Title" })
          vim.api.nvim_set_hl(0, "NotifyINFOIcon", { link = "Statement" })
          vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { link = "Constant" })
          vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { link = "Normal" })
          vim.api.nvim_set_hl(0, "NotifyERRORTitle", { link = "ErrorMsg" })
          vim.api.nvim_set_hl(0, "NotifyWARNTitle", { link = "Title" })
          vim.api.nvim_set_hl(0, "NotifyINFOTitle", { link = "Statement" })
          vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { link = "Constant" })
          vim.api.nvim_set_hl(0, "NotifyTRACETitle", { link = "Normal" })
        end,
      })
      vim.cmd([[colorscheme iceberg]])
    end,
  },
}

