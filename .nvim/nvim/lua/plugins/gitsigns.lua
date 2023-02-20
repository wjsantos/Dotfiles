local setup, gitsigns = pcall(require, "gitsigns")
if not setup then return end

gitsigns.setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
})

-- https://github.com/lewis6991/gitsigns.nvim
-- to see more configs
