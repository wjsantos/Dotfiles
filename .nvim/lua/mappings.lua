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
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  opts.max_width= opts.max_width or 80
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

keymap.set('n', '<space>e', vim.diagnostic.open_float)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local bufopts = { noremap=true, silent=true, buffer=bufnr }
keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

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
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fq', builtin.quickfixhistory, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set("n", "<leader>fw", ":Telescope whop<CR>", { noremap = true, desc = "whop.nvim (telescope)" })

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

-- vim-test
keymap.set("n", "<leader>t", "<cmd>TestNearest<CR>", {silent = true})
keymap.set("n", "<leader>T", "<cmd>TestFile<CR>", {silent = true})
keymap.set("n", "<leader>a", "<cmd>TestSuite<CR>", {silent = true})
keymap.set("n", "<leader>l", "<cmd>TestLast<CR>", {silent = true})
keymap.set("n", "<leader>g", "<cmd>TestVisit<CR>", {silent = true})
-- let test#strategy = { 'nearest': 'neovim', 'file':    'dispatch', 'suite':   'basic' }
--
-- vim-go mappings
-- go tests
keymap.set("n", '<leader>ta', "<cmd>GoTest<cr>")
keymap.set("n", '<leader>tt', "<cmd>GoTestFile<cr>")
keymap.set("n", '<leader>tf', "<cmd>GoTestFunc<cr>")
keymap.set("n", '<leader>tp', "<cmd>GoTestPkg<cr>")
keymap.set("n", '<leader>dtt', "<cmd>GoDebug -t<cr>")
keymap.set("n", '<leader>dtf', "<cmd>GoDebug -n<cr>")
keymap.set("n", '<leader>dtp', "<cmd>GoDebug -p<cr>")

-- go debug
keymap.set("n", '<F5>',  "<cmd>GoDbgContinue<cr>")
keymap.set("n", '<F7>',  "<cmd>DapStepInto<cr>")
keymap.set("n", '<F8>',  "<cmd>DapStepOver<cr>")
keymap.set("n", '<F9>',  "<cmd>GoBreakToggle<cr>")
keymap.set("n", '<F10>', "<cmd>GoDbgStop<cr>")
keymap.set("n", '<S-F10>', "<cmd>GoDbgKeys<cr>")

-- go debug mappings
-- c	continue
-- n	next
-- s	step
-- o	stepout
-- S	cap S: stop debug
-- u	up
-- D	cap D: down
-- C	cap C: run to cursor
-- b	toggle breakpoint
-- P	cap P: pause
-- p	print, hover value (also in visual mode)

-- go general
keymap.set("n", '<leader>tags', "<cmd>GoAddTags<cr>")
keymap.set("n", '<leader>fill', "<cmd>GoFillStruct<cr>")
keymap.set("n", '<leader>A', "<cmd>GoAlt<cr>")
