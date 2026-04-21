return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter.git",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {},
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end
  },
}
