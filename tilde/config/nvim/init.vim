" This vimrc is "inspired" by @moonglum, @garybernhardt and @railsbros-dirk
" Thanks to all of you for letting me steal your stuff :)

" Activate Syntax Highlight
syntax enable
" set default encoding to UTF-8
set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Deactivate Wrapping
set nowrap
" Treat all numbers as decimal
set nrformats=
" I don't like Swapfiles
set noswapfile
" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" I prefer , to be the leader key
let mapleader = ","
" show line numbers
set number
" MOAR colors
set t_Co=256
" Unselect the search result
map <Leader><Space> :noh<CR>
" Better buffer handling
set hidden
" hightlight cursor position
set cursorline

" Use the clipboard of Mac OS
if has('mac')
  set clipboard=unnamed
end

" Set the title of the iterm tab
set title

set diffopt=vertical,filler
autocmd FileType git set nofoldenable

call plug#begin('~/.config/nvim/plugged')

" CtrlP: Full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Borrowed from @skwp
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'e'

noremap <C-b> :CtrlPBuffer<CR>
let g:ctrlp_dont_split = 'NERD_tree_2'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

" Git marker for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Color Theme
Plug 'altercation/vim-colors-solarized'

" Polyglot: A collection of language packs, loaded on demand
Plug 'sheerun/vim-polyglot'

" Syntastic: Really great Syntax checker
Plug 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='🙀'
let g:syntastic_warning_symbol='😿'

" ack.vim: ack integration
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag -S --nogroup --column'

" Better statusbar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airlinetheme = "solarized"

let g:airline#extensions#branch#displayed_head_limit = 17

set laststatus=2

Plug 'tpope/vim-fugitive'

" Git Gutter: shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
" without any weird color
highlight clear SignColumn

" Cool Undo Tree
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
noremap <Leader>g :GundoToggle<CR>

" Tab completion
Plug 'ervandew/supertab'

" Better * search for selections.
" http://vimcasts.org/episodes/search-for-the-selected-text/
Plug 'nelstrom/vim-visual-star-search'

" Open Markdown files in Marked
Plug 'itspriddle/vim-marked'
noremap <leader>m :MarkedOpen<CR>
let g:marked_app = "Markoff"

" Toggle comment blocks
Plug 'tpope/vim-commentary'

Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-rails'
Plug 'bronson/vim-trailing-whitespace'

" Textobj Rubyblock: Custom text object for selecting ruby blocks
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'jeetsukumaran/vim-buffergator'

" My self written plugins
Plug 'bitboxer/vim-playpause'

Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2
let g:goyo_width=80

function! s:goyo_enter()
  set textwidth=80
  set wrap linebreak
endfunction

function! s:goyo_leave()
  set textwidth&
  set nowrap
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

Plug 'kassio/neoterm'

let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',rt'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,ra :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" closes the terminal buffers
nnoremap <silent> ,rc :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,rl :call neoterm#clear()<cr>
" kills the current job
nnoremap <silent> ,rk :call neoterm#kill()<cr>

" create directory if it does not exist
Plug 'DataWraith/auto_mkdir'

" resize windows easily
Plug 'jimsei/winresizer'

" show git history in vim
Plug 'junegunn/gv.vim'

" remove everything except the current buffer
Plug 'vim-scripts/BufOnly.vim', {'on': ['Bonly', 'BOnly', 'Bufonly', 'BufOnly'] }

" zoom current buffer
Plug 'troydm/zoomwintab.vim', { 'on': ['ZoomWinTabToggle', 'ZoomWinTabIn', 'ZoomWinTabOut'] }
nnoremap <silent> ,zz :ZoomWinTabToggle<cr>

" **[ experimental area - start ]************************************

Plug 'fatih/vim-go'

" **[ experimental area - end   ]************************************

" --- End ---
call plug#end()

" colorscheme Tomorrow-Night-Bright
set background=dark
colorscheme solarized

" Show invisible characters:
" Tabs and trailing whitespace
set list
set listchars=tab:›\ ,trail:.
" Tabs should be 2 spaces

set tabstop=2
" Soft-Tabs should be 2 spaces
set softtabstop=2
" When shifting, use 2 spaces
set shiftwidth=2
" Use Soft-Tabs
set expandtab
" backspace through everything in insert mode
set backspace=indent,eol,start
" Makefiles require tabs
autocmd FileType make setlocal noexpandtab

" Highlight Characters that overstep the 100 character limit
set colorcolumn=100

" Automatically set the indent of a new line (local to buffer)
" from railsbros-dirk
set ai

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Make sure all markdown files have the correct filetype
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown
au BufRead,BufNewFile *.{cehtml} set ft=html

" Set the Ruby filetype for a number of common Ruby files without .rb
au BufRead,BufNewFile {Berksfile,Vagrantfile,Procfile,config.ru,*.god,*.arb} set ft=ruby

" Treat JSON files like JavaScript
au BufNewFile,BufRead {*.json,*.jsm} set ft=javascript

" Recognize CoffeeScript
au BufNewFile,BufRead *.coffee set ft=coffee

" zsh themes are sh files
au BufNewFile,BufRead *.zsh-theme set ft=sh

" Added Javascript Template Support
au BufNewFile,BufRead *.ejs set filetype=jst

" Make cursor move by visual lines instead of file lines (when wrapping)
noremap k gk
noremap j gj

" upper/lower word
nnoremap <leader>u mQviwU`Q
nnoremap <leader>l mQviwu`Q

" upper/lower first char of word
nnoremap <leader>U mQgewvU`Q
nnoremap <leader>L mQgewvu`Q

" Move selected block
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" ARROW KEYS ARE UNACCEPTABLE
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Show contents of registers and paste selected into the buffer
function! Reg()
  reg
  echo "Register: "
  let char = nr2char(getchar())
  if char != "\<Esc>"
    execute "normal! \"".char."p"
  endif
  redraw
endfunction

command! -nargs=0 Reg call Reg()

" paste something using the paste mode
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" find merge conflict markers
nnoremap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Replace selection with text in clipboard
vnoremap r "_dP

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" Spelling highlights in bright green
hi clear SpellBad
hi SpellBad ctermfg=red cterm=bold,underline

" Enable spell as default only for certain files
autocmd FileType markdown setlocal spell spelllang=en,de
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell spelllang=en,de

" Switch spell checking language
command! British :set spelllang=en_gb
command! American :set spelllang=en_us
command! German :set spelllang=de

" enable project based vimrc
set exrc
set secure

