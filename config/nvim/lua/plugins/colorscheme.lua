return {

  -- iceberg
  {
    "https://github.com/cocopon/iceberg.vim.git",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme iceberg]])
    end,
  },
}

