call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'morhetz/gruvbox' " Colour scheme
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'tpope/vim-commentary' " Smart commenting
Plug 'tpope/vim-repeat' " Apply repeat to plugin maps
Plug 'tpope/vim-surround' " Mappings for pairs
Plug 'jiangmiao/auto-pairs' " Auto apply matching pairs
Plug 'windwp/nvim-autopairs'
Plug 'RRethy/vim-illuminate' " Plugin to highlight the word under the cursor
" Plug 'itchyny/vim-cursorword'
Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ Syntax Highlighting
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale' " Provide fixing and linting
Plug 'dyng/ctrlsf.vim' " File content searching
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
" Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " command-line fuzzy search
Plug 'junegunn/fzf.vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()


runtime coc.vim

let mapleader = " "
"---------- Formatting
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus "sudo apt install vim-gtk"
set smartindent
set scrolloff=1
set nu
set relativenumber
set nowrap
autocmd VimResized * wincmd =
"---------- Search
set smartcase
set ignorecase
set hlsearch
set incsearch
set wildmenu
"---------- Files
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set autoread
set splitbelow
set splitright

" set background=dark
colorscheme gruvbox
" set notermguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \}

" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1

"
"---------- auto-pairs
" let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

"---------- ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" \   'python': ['pylint'],
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'json': ['jq'],
\   'css': ['prettier'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 0
"--- ale
nnoremap <leader>a :ALEFix<CR>

"---------- NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalMenu=1


"---------------Mappings ----------------
"--- Line and paragraph navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"--- Tab and Shift-Tab indenting
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
" Note that <tab> and <C-i> are strictly equivalent
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

"-- Undo break points
inoremap , ,<c-g>u

"--- fzf.vim commands
nnoremap <leader>b :BLines<CR>
nnoremap <leader>ls :Buffers<CR>
nnoremap <C-p> :Files <CR>
nnoremap <leader>f :Ag<space>

"---------- ctrlsf
" Need to install 'ag'
" sudo apt-get install silversearcher-ag
nmap     <leader>F :CtrlSF -R<space>
vmap     <leader>f <Plug>CtrlSFVwordPath<CR>
nmap     <leader>f <Plug>CtrlSFCwordPath<CR>
nnoremap <leader>t :CtrlSFToggle<CR>
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_auto_focus = {
  \ "at":"start"
  \ }

"--- fugitive
nnoremap <leader>gs :G<CR>


"--- Other
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>vim :tabf $MYVIMRC<CR>
nnoremap <leader>. :cd %:h<CR>
nnoremap <leader>g 2<C-g><CR>
inoremap jk <Esc>

" quickfix window
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

" enable spell-check for markdown files
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal wrap
