call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'morhetz/gruvbox' " Colour scheme
Plug 'tpope/vim-commentary' " Smart commenting
Plug 'tpope/vim-repeat' " Apply repeat to plugin maps
Plug 'tpope/vim-surround' " Mappings for pairs
Plug 'jiangmiao/auto-pairs' " Auto apply matching pairs
Plug 'windwp/nvim-autopairs'
Plug 'RRethy/vim-illuminate' " Plugin to highlight the word under the cursor
Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ Syntax Highlighting
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale' " Provide fixing and linting
Plug 'dyng/ctrlsf.vim' " File content searching
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " command-line fuzzy search
Plug 'junegunn/fzf.vim'

call plug#end()

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

"---------- gruvbox
set background=dark
colorscheme gruvbox
set termguicolors

"---------- auto-pairs
" let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>', "'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

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
\   'cpp': ['clang-format'],
\}
let g:ale_fix_on_save = 0

"---------- NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1


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

" quickfix window
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
