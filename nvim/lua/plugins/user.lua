-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  
  -- Unified AI Assistant Manager
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv("OPENAI_API_KEY"),
          },
          anthropic = {
            endpoint = "https://api.anthropic.com/v1/messages",
            secret = os.getenv("ANTHROPIC_API_KEY"),
          },
          gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:generateContent?key={{secret}}",
            secret = os.getenv("GEMINI_API_KEY"),
          },
          ollama = {
            endpoint = "http://localhost:11434/v1/chat/completions",
            secret = "ollama",
          },
        },
        agents = {
          {
            name = "Claude",
            provider = "anthropic",
            model = "claude-3-5-sonnet-20241022",
            system_prompt = "You are a helpful AI programming assistant. Be concise and practical.",
          },
          {
            name = "Gemini",
            provider = "gemini", 
            model = "gemini-pro",
            system_prompt = "You are a helpful AI assistant. Provide clear, accurate responses.",
          },
          {
            name = "CodeLlama",
            provider = "ollama",
            model = "codellama:7b",
            system_prompt = "You are a code generation assistant. Focus on writing clean, efficient code.",
          },
          {
            name = "Mistral",
            provider = "ollama",
            model = "mistral:7b", 
            system_prompt = "You are a helpful AI assistant with strong reasoning capabilities.",
          },
          {
            name = "Gemma",
            provider = "ollama",
            model = "gemma:7b",
            system_prompt = "You are a helpful general-purpose AI assistant.",
          },
        },
      })
    end,
    keys = {
      -- AI Selection and Chat
      { "<leader>as", "<cmd>GpAgent<cr>", desc = "Select AI Agent" },
      { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New AI Chat" },
      { "<leader>at", "<cmd>GpChatToggle<cr>", desc = "Toggle AI Chat" },
      { "<leader>af", "<cmd>GpChatFinder<cr>", desc = "Find AI Chats" },
      
      -- Code Operations
      { "<leader>ar", "<cmd>GpRewrite<cr>", desc = "AI Rewrite", mode = "v" },
      { "<leader>aa", "<cmd>GpAppend<cr>", desc = "AI Append", mode = "v" },
      { "<leader>ao", "<cmd>GpPrepend<cr>", desc = "AI Prepend", mode = "v" },
      { "<leader>ai", "<cmd>GpImplement<cr>", desc = "AI Implement", mode = "v" },
      
      -- Quick Actions
      { "<leader>ae", "<cmd>GpExplain<cr>", desc = "AI Explain", mode = "v" },
      { "<leader>au", "<cmd>GpUnitTests<cr>", desc = "AI Unit Tests", mode = "v" },
      { "<leader>ad", "<cmd>GpDocstring<cr>", desc = "AI Docstring", mode = "v" },
    },
  },

  -- Claude Code integration (for terminal workflow)
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("claude-code").setup()
    end,
    keys = {
      { "<C-,>", "<cmd>ClaudeCode<cr>", desc = "Claude Code Terminal" },
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude Code Terminal" },
      { "<leader>cC", "<cmd>ClaudeCodeContinue<cr>", desc = "Claude Code Continue" },
    },
  },
  
  -- Simple local AI generation (kept for quick tasks)
  {
    "David-Kunz/gen.nvim",
    config = function()
      require("gen").setup({
        model = "codellama:7b",
        host = "localhost",
        port = "11434",
        display_mode = "float",
        show_prompt = false,
        show_model = true,
        no_auto_close = false,
        debug = false,
      })
    end,
    keys = {
      { "<leader>ag", ":Gen<cr>", desc = "Quick AI Generation", mode = { "n", "v" } },
    },
  },

  -- Additional modern plugins
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
  },

  -- Better search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>S",
        '<cmd>lua require("spectre").toggle()<CR>',
        desc = "Toggle Spectre",
      },
    },
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
