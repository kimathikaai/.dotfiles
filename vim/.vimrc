syntax on

let mapleader = " "
"---------- Formatting
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus "sudo apt install vim-gtk"
set smartindent
set nu
set relativenumber
" set norelativenumber
set nowrap
" set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
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
set undodir=~/.vim/undodir
set undofile
set autoread
set splitbelow
set splitright

"---------- Plugins
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe' " YouCompleteMe
"python3 install.py --all --clangd-completer
"cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=on ..
"ln -s build/compile_commands.json
Plug 'morhetz/gruvbox' " Colour scheme
Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ Syntax Highlighting
Plug 'itchyny/lightline.vim' " statusline/tabline plugin for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " command-line fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'RRethy/vim-illuminate' " Plugin to highlight the word under the cursor
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'preservim/nerdtree'

call plug#end()

"---------- auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

"---------- ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'python': ['black', 'isort'],
\}
"\   'python': ['black'],
"\   'python': ['autopep8', 'yapf']
let g:ale_fix_on_save = 0

"---------- gruvbox
set background=dark
colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

"---------- lightline.vim
set laststatus=2
let g:lightline = {
    \   'colorscheme': 'gruvbox',
    \   'active': {
    \       'left': [ 
    \           [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
    \       ]
    \   },
    \   'component_function': {
    \       'gitbranch': 'FugitiveHead'
    \   }
    \}

"---------- YouCompleteMe
nnoremap <leader>y :YcmCompleter<space>
" nnoremap <S-F12> :YcmCompleter<space>GoToReferences<CR>
nnoremap yr :YcmCompleter<space>GoToReferences<CR>
nnoremap yt :tab<space>YcmCompleter<space>GoTo<CR>
let g:ycm_clangd_args = ['-log=verbose', '--pretty', '--background-index', '--completion-style=detailed']
" Turn off prompting to load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
" Open definition in a new vertical split
let g:ycm_goto_buffer_command = 'split-or-existing-window'

"---------- NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTreeFind | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" keep cursor on NERDTree window
" autocmd VimEnter * NERDTreeFind | if argc() > 0 || exists("s:std_in") | endif

" let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

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

"---------------Mappings ----------------
"--- Tab navigation
nnoremap <C-l> gt
nnoremap <C-h> gT

"--- Line and paragraph navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" noremap K {
" noremap J }
" noremap H ^
" noremap L $

"--- Insert mode navigational keys
"imap <Up>    <Nop>
"imap <Down>  <Nop>
"imap <Left>  <Nop>
"imap <Right> <Nop>
"inoremap <C-k> <Up>
"inoremap <C-j> <Down>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

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

"--- Searching
nnoremap n nzzzv
nnoremap N Nzzzv

"-- Undo break points
inoremap , ,<c-g>u

"--- fzf.vim commands
nnoremap <leader>B :Buffers<CR>
" nnoremap <leader>B :BLines<CR>
nnoremap <leader>b :Lines<CR>
" nnoremap <leader>b :Lines<CR>
nnoremap <C-p> :Files <CR>

"--- ale
nnoremap <leader>a :ALEFix<CR>

"--- Other
nnoremap <leader>so :so ~/.vimrc<CR>
nnoremap <leader>vim :tabf $MYVIMRC<CR>
nnoremap <leader>. :cd %:h<CR>
nnoremap <leader>g 2<C-g><CR>
inoremap jk <Esc>


"--- Resources
" vim registers"
  "https://sanctum.geek.nz/arabesque/advanced-vim-registers/
