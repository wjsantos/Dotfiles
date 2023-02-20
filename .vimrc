let mapleader=","

set nocompatible  "Use Vim settings, rather then Vi settings (much better!).
filetype off      " required
syntax   on       " syntax highlight

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" autowriting files
set autowrite
set autowriteall

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Editor's plugins
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mbbill/undotree'
Plugin 'kburdett/vim-nuuid'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim'

" Lang's plugins
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tmhedberg/matchit'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maralla/completor.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'prettier/vim-prettier'

call vundle#end()            " required
filetype plugin indent on    " required

" Options
set showcmd         "show incomplete cmds down the bottom
set showmode        "show current mode down the bottom
set incsearch       "find the next match as we type the search
set hlsearch        "hilight searches by default
set nowrap          "dont wrap lines
set mouse=a         "some stuff to get the mouse going in term
set t_Co=256        "tell the term has 256 colors
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set nobackup
set noswapfile
set nu
set cursorcolumn
set guifont=Inconsolata\ Bold\ 12
set clipboard=unnamedplus
set ttyfast

" Color scheme
set background=dark
colorscheme deus

" Disable gui options
if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

""" Plugins Configuration

" NERDTree options
nmap <silent> \p :NERDTreeToggle<CR>

" BufExplorer options
nmap <silent> <C-b> :BufExplorer<CR>

" vim-rspec mappings
"let g:rspec_command = "!bundle exec rspec --drb {spec}"
"
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
map <Leader>s :TestNearest<CR>
map <Leader>t :TestFile<CR>
map <Leader>a :TestSuite<CR>
map <Leader>l :TestLast<CR>
map <Leader>g :TestVisit<CR>
let test#ruby#bundle_exec = 1
let test#ruby#minitest#executable = 'source .env && RAILS_ENV=test bundle exec rails test'

" Undotree mappings
nmap <silent> <Leader>u :UndotreeToggle<CR>

" UUID mappings
let g:nuuid_no_mappings = 1
nmap <Leader>d <Plug>Nuuid

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

" NERDTree parent folder
map \o :e %:h<CR>

set statusline+=%#warningmsg#
set statusline+=%*

" NerdCommenter
vmap <silent> <C-_> <Plug>NERDCommenterToggle<CR>

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.log/vim/verbose.log
        set verbose=15
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

" Enable lsp for go by using gopls ; CTRL + X + O
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" SHIFT + K
let g:go_doc_popup_window = 1
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1

" WINDOW ZOOMING
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" vim-go debug
noremap <F5> :GoDebugContinue<CR>
noremap <c-F5> :GoDebugHalt<CR>
noremap <F9> :GoDebugBreakpoint<CR>
noremap <c-F10> :GoDebugStart<CR>
noremap <F10> :GoDebugNext<CR>
noremap <F11> :GoDebugStep<CR>
noremap <c-F11> :GoDebugStepOut<CR>

" set fizz files to go syntax
autocmd BufNewFile,BufRead *.fizz set syntax=go

" vim prettier
packloadall

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" vim-snippets
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" persistent undotree
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif











