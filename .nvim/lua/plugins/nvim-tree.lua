local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then return end

vim.cmd([[
  nnoremap - :NvimTreeToggle<CR>
  " NERDTree parent folder
  map \o :e %:h<CR>
]])

local keymap = vim.keymap -- for conciseness
keymap.set("n", '\\p', ":NvimTreeToggle<CR>") -- toggle file explorer

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false --                  " Disable folding at startup.

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local WIDTH_RATIO = 0.15

nvimtree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  view = {
    relativenumber = false,
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
  renderer = {
    indent_width = 1,
  },
})
