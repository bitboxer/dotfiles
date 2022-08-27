" This vimrc is "inspired" by @moonglum, @garybernhardt and @railsbros-dirk
" Thanks to all of you for letting me steal your stuff :)

" Activate Syntax Highlight
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

" enable mouse
set mouse=a

set inccommand=split

" Use the clipboard of Mac OS
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
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

let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Git marker for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowIgnoredStatus=0

" Better statusbar
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17
set laststatus=2

" Color Theme
Plug 'ellisonleao/gruvbox.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


Plug 'Einenlum/yaml-revealer'

" vue files need special handling because of their
" mix of different languages in one big file
autocmd FileType vue syntax sync fromstart

" ack.vim: ack integration
Plug 'mileszs/ack.vim'
if executable('rg')
  let g:ackprg = 'rg --vimgrep -i'
endif

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

" Toggle comment bloccks
Plug 'scrooloose/nerdcommenter'

" vue files have mixed content, so this
" informs nerdcommenter about that.
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-rails'

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
      \ ['   Bookmarks:'],
      \ 'bookmarks',
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

" Align all the stuff
Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

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
let g:neomake_markdown_enabled_makers = ['alex', 'markdownlint']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

command Errors lopen

" Elixir
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_map = '<C-L>'
let g:alchemist_tag_stack_map = '<C-S>'

Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'

" github pull requests
Plug 'AndrewRadev/ginitpull.vim'

Plug 'enricobacis/vim-airline-clock'

Plug 'janko-m/vim-test'
let test#strategy = "neovim"
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rr :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>

Plug 'blueyed/vim-qf_resize'

Plug 'jreybert/vimagit'

Plug 'Chiel92/vim-autoformat'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:elixir_autoformat_enabled = 1

autocmd FileType javascript au BufWrite * :Autoformat

Plug 'mhinz/vim-mix-format'
" let g:mix_format_on_save = 1

" **[ experimental area - end   ]************************************

" --- End ---
call plug#end()

" colorscheme Tomorrow-Night-Bright
set background=dark
colorscheme gruvbox

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

" Highlight Characters that overstep the character limit
set colorcolumn=80

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

lua <<EOF
require('nvim-treesitter.configs').setup {
  -- one of "all", "maintained" (parsers with maintainers),
  -- or a list of languages
  ensure_installed = { "javascript", "ruby", "elixir", "comment", "typescript" },
  highlight = {
    enable = true
  }
}

require('nvim-lsp-installer').setup {
  automatic_installation = true
}

-- Actually setup the language servers so that they're available for
-- our LSP client. I'm mainly working with Ruby and JS, so I'm configuring
-- language servers for these 2 languages
local nvim_lsp = require('lspconfig')
nvim_lsp.solargraph.setup{}
nvim_lsp.tsserver.setup{}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['elixirls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
EOF

