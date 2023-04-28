-- bufexplorer
local keymap = vim.keymap -- for conciseness
keymap.set("n", '<C-b>', ":ToggleBufExplorer<CR>") -- toggle bufexplorer

-- nerdtree
vim.cmd([[
  " NERDTree options
  nmap <silent> \p :NERDTreeToggle<CR>

  " NERDTree parent folder
  map \o :e %:h<CR>
]])

-- COMMENT VISUAL MODE BINDINGS
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment

-- window nav
keymap.set("n", '<C-h>', "<C-w>h")
keymap.set("n", '<C-j>', "<C-w>j")
keymap.set("n", '<C-k>', "<C-w>k")
keymap.set("n", '<C-l>', "<C-w>l")

-- uuid
keymap.set("n", '<Leader>d', "<Plug>Nuuid")

-- LSP
local bufopts = { noremap=true, silent=true, buffer=bufnr }
keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

-- LSP autocomplete
vim.cmd([[
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
]])

-- Prettier
vim.cmd([[
" formatting in normal mode
nmap <Leader>f :Prettier<CR>

" range_formatting in visual mode
xmap <buffer> <Leader>f :Prettier<CR>
]])

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})

-- Trouble
-- Lua
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
