-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Formatters
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier.with {
        extra_filetypes = { "toml" },
      },
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.rubocop,
      null_ls.builtins.formatting.shfmt,
      
      -- Linters
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.yamllint,
      
      -- Code actions
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.shellcheck,
    })
  end,
}
