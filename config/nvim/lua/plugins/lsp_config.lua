return {
  {
    "https://github.com/mason-org/mason-lspconfig.nvim.git",
    dependencies = {
      {
        "https://github.com/mason-org/mason.nvim.git",
        opts = {},
      },
      "https://github.com/neovim/nvim-lspconfig.git",
    },
    config = function()
      local ensure_installed = {
        "lua_ls",
        "stylua",
        "ts_ls",
      }
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = ensure_installed,
      })
      vim.lsp.enable(ensure_installed)
    end
  },
}
