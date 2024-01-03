vim.cmd([[
  let test#strategy = { 'nearest': 'neovim', 'file':    'neovim', 'suite':   'neovim' }
  let g:test#neovim#start_normal = 0 " If using neovim strategy
  let test#neovim#term_position = "bo 10"
]])

