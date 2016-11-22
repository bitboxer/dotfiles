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
let g:neoterm_shell = "zsh"
let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',rt'
let g:neoterm_raise_when_tests_fail = 1
let g:neoterm_focus_when_tests_fail = 1

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

Plug 'mhinz/vim-startify'

autocmd User Startified setlocal buftype=
let g:ctrlp_reuse_window = 'startify'

let g:startify_files_number           = 6
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_custom_header = ["   Welcome! "]

let g:startify_list_order = [
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ['   LRU:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ '/Users/mhi/local/vim/share/vim/vim74/doc',
            \ ]

let g:startify_bookmarks = [
            \ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" open files with vim file:123
Plug 'bogado/file-line'

" Tagging is all the rage
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.tags_cache'

" Align all the stuff
Plug 'vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" the tab complete thing
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote'), 'tag': '*' }

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" **[ experimental area - start ]************************************

Plug 'beloglazov/vim-online-thesaurus'
nnoremap <leader>k :OnlineThesaurusCurrentWord<CR>

Plug 'dbmrq/vim-ditto'

au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake

command Errors lopen

" Elixir
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_disable = 1

Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'

" github pull requests
Plug 'AndrewRadev/ginitpull.vim'

Plug 'terryma/vim-multiple-cursors'

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

" Show the linebreak if wrapping is enabled
set showbreak=↪

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

