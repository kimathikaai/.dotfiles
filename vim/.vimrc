syntax on

"---------- Formatting
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set colorcolumn=80
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

"---------- Plugins
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe' " YouCompleteMe
"python3 install.py --all --clangd-completer
"cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=on ..
"ln -s build/compile_commands.json
Plug 'morhetz/gruvbox' " Colour scheme
Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ Syntax Highlighting
Plug 'Valloric/YouCompleteMe' " YouCompleteMe
Plug 'itchyny/lightline.vim' " statusline/tabline plugin for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " command-line fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'RRethy/vim-illuminate' " Plugin to highlight the word under the cursor
Plug 'leafgarland/typescript-vim' " A plugin for typescript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty' " React
Plug 'preservim/nerdtree' " File tree explorer

call plug#end()

"---------- gruvbox
set background=dark
colorscheme gruvbox
"hi Normal guibg=NONE ctermbg=NONE

"---------- NERDTree
let NERDTreeShowHidden=1 " Show dot files

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
let g:ycm_clangd_args = ['-log=verbose', '--pretty', '--background-index', '--completion-style=detailed']
" Turn off prompting to load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
"---------------Mappings ----------------
let mapleader = " "
"--- Tab navigation
nnoremap <leader>l gt
nnoremap <leader>h gT
"--- Line and paragraph navigation
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
noremap K {
noremap J }
noremap H ^
noremap L $
"--- Insert mode navigational keys
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"--- Tab and Shift-Tab indenting
" Note that <tab> and <C-i> are strictly equivalent
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv
"--- fzf.vim commands
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>B :BLines<CR>
nnoremap <C-p> :Files <CR>
"--- Pairing braces
inoremap ( ()<left>
inoremap () ()
"inoremap (; ();
"inoremap [ []<left>
"inoremap [] []
inoremap { {}<left>
inoremap {} {}
inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"--- YCM
nnoremap <leader>y :YcmCompleter<space>
nnoremap <S-F12> :YcmCompleter<space>GoToReferences<CR>
nnoremap <F12> :YcmCompleter<space>GoTo<CR>
"--- NERDTree
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
"--- Other
nnoremap <leader>so :so ~/.vimrc<CR>
nnoremap <leader>vim :tabf $MYVIMRC<CR>
nnoremap <leader>. :cd %:h<CR>


