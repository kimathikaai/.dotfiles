syntax on

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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'rust-lang/rust.vim'
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
\}
" \   'python': ['pylint'],
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
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

"---------- NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

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

"--- Searching
nnoremap n nzzzv
nnoremap N Nzzzv

"-- Undo break points
inoremap , ,<c-g>u

"--- fzf.vim commands
" nnoremap <leader>B :Buffers<CR>
" nnoremap <leader>B :BLines<CR>
nnoremap <leader>b :Lines<CR>
" nnoremap <leader>b :Lines<CR>
nnoremap <C-p> :Files <CR>

"--- fugitive
nnoremap <leader>gs :G<CR>
"--- ale
nnoremap <leader>a :ALEFix<CR>

"--- Other
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>vim :tabf $MYVIMRC<CR>
nnoremap <leader>. :cd %:h<CR>
nnoremap <leader>g 2<C-g><CR>
inoremap jk <Esc>

 
""" COC config
" Map <tab> to trigger completion and navigate to the next item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use [g and ]g to navigate diagnostics
" Use :CocDiagnostics to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> T :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader> rn <Plug>(coc-rename)

