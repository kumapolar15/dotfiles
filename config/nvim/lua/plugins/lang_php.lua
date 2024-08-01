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
}
