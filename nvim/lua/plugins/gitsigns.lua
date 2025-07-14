return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "left_align", -- 👈 show blame at the start of the line
      delay = 300,
      ignore_whitespace = false,
    },
  },
  keys = {
    { "<leader>gl", function() require("gitsigns").blame_line() end, desc = "Git blame line" },
    { "<leader>gL", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle inline blame" },
  },
}
