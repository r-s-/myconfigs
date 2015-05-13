"Ryan Selk's .vimrc
"I don't suggest you copy this, but instead find the
"commands which work for you.

"set leader to space
let mapleader = "\<Space>"

"Pathogen for easy plugin managment
call pathogen#infect()
call pathogen#helptags()

set tabstop=2 shiftwidth=2 expandtab

"relative numbers by default
set number
set relativenumber

set autoread

"Allow toggle between regular and relative numbers
nnoremap <C-N> :set invrnu<cr>

filetype on
filetype plugin indent on
au BufNewFile,BufRead *.rs set filetype=rust
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on

"map jj to switch out of insert mode
:imap jj <Esc>

"Auto indentation
:set cindent
:set shiftwidth=2
:set autoindent

"swap
:set noswapfile

"Switch ; and : keys
nnoremap ; :
nnoremap : ;

"Auto Add braces ({{ to add single brace)
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {

"Ctrl-p for fuzzy finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1 "use .* for wildcard
nnoremap <Leader>p :CtrlP<CR>

"NERDTree shortcuts
:command NE NERDTree
:command NF NERDTreeFind

"Navigate splits with vim-line commands
map <Tab> <C-W>
nnoremap <Tab>- <C-W>n
nnoremap <Tab>= <C-W>v

"More standard splits
set splitbelow
set splitright

"keep the visual selection active after indenting.
vmap > >gv
vmap < <gv

" Easy motion settings
hi EasyMotionTarget ctermbg=gray ctermfg=green
hi EasyMotionShade  ctermbg=gray ctermfg=blue

hi EasyMotionTarget2First ctermbg=gray ctermfg=red
hi EasyMotionTarget2Second ctermbg=gray ctermfg=lightred
map <Space> <Plug>(easymotion-prefix)

" Use easymotion for search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"save undo history
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"colors for text suggestion
highlight Pmenu ctermfg=black ctermbg=white
highlight PmenuSel ctermfg=red  ctermbg=grey

"change the line numbers to be brighter
highlight LineNr ctermfg=grey
hi Visual ctermbg=20

"allow backspace to delete in insert mode
set backspace=2

"set colorscheme to hybrid
colorscheme hybrid


"Nvim terminal commands
if has('nvim')
  tnoremap <Leader>e <C-\><C-n> 
  tnoremap <Esc> <C-\><C-n> 
  nnoremap <Leader>t :tabe<cr>
  nnoremap <Leader>e :term<cr>
endif

