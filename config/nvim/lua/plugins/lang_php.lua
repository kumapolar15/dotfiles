return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "phpcs",
        "phpcbf",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "phpcbf" },
      },
      formatters = {
        phpcbf = {
          meta = {
            url = "https://phpqa.io/projexts/phpcbf.html",
            description = "PHP Code Beautifier and Fixer fixes violations of a defined set of coding standards.",
          },
          command = require("conform.util").find_executable({
            "vendor/bin/phpcbf",
          }, "phpcbf"),
          args = { "$FILENAME" },
          stdin = false,
          cwd = require("conform.util").root_file({ "composer.json" }),
          tmpfile_format = "conform.$RANDOM.$FILENAME",
          exit_codes = { 0, 1, 2 },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        -- command = os.getenv("COPILOT_NODE_PATH"),
        command = "/Users/kumashirokazeto/.local/share/mise/installs/node/20/bin/node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
    end,
  },
}
