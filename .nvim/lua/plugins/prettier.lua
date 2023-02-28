local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

vim.cmd([[
" formatting in normal mode
nmap <Leader>f :Prettier<CR>

" range_formatting in visual mode
xmap <buffer> <Leader>f :Prettier<CR>
]])
