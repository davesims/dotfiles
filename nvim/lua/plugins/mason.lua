-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- Language servers
        "lua-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "yaml-language-server",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "ruby-lsp",
        "solargraph",
        "pyright",
        "rust-analyzer",
        "terraform-ls",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "marksman",
        "bash-language-server",

        -- Formatters
        "stylua",
        "prettier",
        "black",
        "isort",
        "rubocop",
        "shfmt",
        "terraform-fmt",

        -- Linters
        "eslint_d",
        "flake8",
        "shellcheck",
        "yamllint",

        -- Debuggers
        "debugpy",
        "js-debug-adapter",
        "codelldb",

        -- Other tools
        "tree-sitter-cli",
      },
    },
  },
}
