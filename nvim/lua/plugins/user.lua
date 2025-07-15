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
  
  -- AI Assistant integrations
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("claude-code").setup()
    end,
  },
  
  -- Gemini AI integration
  {
    "David-Kunz/gen.nvim",
    config = function()
      require("gen").setup({
        model = "gemini-pro",
        host = "localhost",
        port = "11434",
        display_mode = "float",
        show_prompt = false,
        show_model = false,
        no_auto_close = false,
        debug = false
      })
    end,
    keys = {
      { "<leader>ai", ":Gen<cr>", desc = "Open AI Generation", mode = { "n", "v" } },
      { "<leader>ag", ":Gen Generate<cr>", desc = "Generate with AI", mode = { "n", "v" } },
      { "<leader>ac", ":Gen Chat<cr>", desc = "Chat with AI", mode = { "n", "v" } },
    },
  },

  -- Alternative: Simple Gemini integration
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup({
        providers = {
          gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:generateContent?key={{secret}}",
            secret = os.getenv("GEMINI_API_KEY"),
          },
        },
        agents = {
          {
            name = "Gemini",
            provider = "gemini",
            model = "gemini-pro",
            system_prompt = "You are a helpful AI assistant.",
          },
        },
      })
    end,
    keys = {
      { "<leader>gp", "<cmd>GpChatToggle<cr>", desc = "Toggle Gemini Chat" },
      { "<leader>gc", "<cmd>GpChatNew<cr>", desc = "New Gemini Chat" },
      { "<leader>gr", "<cmd>GpRewrite<cr>", desc = "Rewrite with Gemini", mode = "v" },
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
