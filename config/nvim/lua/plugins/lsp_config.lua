return {
  {
    "https://github.com/mason-org/mason-lspconfig.nvim.git",
    dependencies = {
      {
        "https://github.com/mason-org/mason.nvim.git",
        opts = {},
      },
      "https://github.com/neovim/nvim-lspconfig.git",
      "https://github.com/hrsh7th/cmp-nvim-lsp.git"
    },
    config = function()
      local ensure_installed = {
        "lua_ls",
        "stylua",
        "ts_ls",
        "copilot",
      }
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = ensure_installed,
      })
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })
      vim.lsp.enable(ensure_installed)
    end
  },
  {
    "https://github.com/folke/lazydev.nvim.git",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}lub/library", words = { "vim%.uv" } },
      },
    },
  },
}
