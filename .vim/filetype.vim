" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.ex,*.exs,*.eex  setfiletype elixir
augroup END
