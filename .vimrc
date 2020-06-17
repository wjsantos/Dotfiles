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
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kburdett/vim-nuuid'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'

" Lang's plugins
Plugin 'tmhedberg/matchit'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'noahfrederick/vim-composer'
Plugin 'noahfrederick/vim-laravel'
Plugin 'joonty/vim-phpqa'
Plugin 'rust-lang/rust.vim'

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

" Pry macro
map ,p Orequire 'pry'; binding.pry<ESC>
map ,y O$self = $this ; \Psy\Shell::debug(get_defined_vars());<ESC>

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

" NERDTree parent folder
map \o :e %:h<CR>

" PHP
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F8> :TagbarToggle<CR>
