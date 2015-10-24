let g:startify_custom_header = [
      \ '                                                 ',
      \ '     .---------------------------------.         ',
      \ '     |  .---------------------------.  |         ',
      \ '     |[]|                           |[]|         ',
      \ '     |  |                           |  |         ',
      \ '     |  |         Ryan Selk         |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  |                           |  |         ',
      \ '     |  `---------------------------l  |         ',
      \ '     |      __________________ _____   |         ',
      \ '     |     |   ___            |     |  |         ',
      \ '     |     |  |   |           |     |  |         ',
      \ '     |     |  |   |           |     |  |         ',
      \ '     |     |  |   |           |     |  |         ',
      \ '     |     |  |___|           |     |  |         ',
      \ '     \_____|__________________|_____|__|         ',
      \ '                                                 ',
      \ '                                                 ']
let g:startify_list_order = ['dir']
set nocompatible

"set leader to space
let mapleader = "\<Space>"

"custom leader commands
nnoremap <leader>p :FZF<cr>
nnoremap <leader>l :CtrlPTag<cr>
nnoremap <leader>o :CtrlPBuffer<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>ne :NERDTree<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>bb :ls<cr>:buffer<Space>
nnoremap <leader>t :tabe<cr>
nnoremap <leader>1 :bn<cr>
nnoremap <leader>0 :bp<cr>
nnoremap <leader>c :bd<cr>
nnoremap <leader>f :Ag 
nnoremap <leader>r :reg<cr>
nnoremap <leader>in :call I18nTranslateString()<cr>
nnoremap <leader>gu :GundoToggle<cr>
nnoremap <leader>ki :call GitStoryId()<cr>
nnoremap <leader>so :call ToggleSyntax()<cr>
nnoremap <leader>ln :set invrnu<cr>

"Switch ; and : keys
nnoremap ; :
nnoremap : ;

"neovim terminal emulation
tnoremap <Esc> <C-\><C-n> 
nnoremap <leader>e :term<cr>

" tab settings
set tabstop=2 shiftwidth=2 expandtab

"relative numbers by default
set number
set relativenumber
set autoread
set hidden

"Auto indentation
set cindent
set shiftwidth=2
set autoindent

filetype on
filetype plugin indent on
syntax on

"map jj to switch out of insert mode
imap jj <Esc>

"swap
set noswapfile

" Tab for easier window managment
map <Tab> <C-W>

"More standard splits
set splitbelow
set splitright
set scrolloff=2

"keep the visual selection active after indenting.
vmap > >gv
vmap < <gv

" Easy motion settings
hi EasyMotionTarget ctermbg=gray ctermfg=green
hi EasyMotionShade  ctermbg=gray ctermfg=blue
hi EasyMotionTarget2First ctermbg=gray ctermfg=red
hi EasyMotionTarget2Second ctermbg=gray ctermfg=lightred

map <Space><Space> <Plug>(easymotion-prefix)
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

set t_Co=256

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

"These settings can speed up vim
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw

" Custom functions
function! GitStoryId()
  normal 3j3WywggpI[#A] 
endfunction

function ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

"vim-plug for easy cross machine plugin handling
call plug#begin('~/.nvim/plugged')
  Plug 'rhysd/clever-f.vim'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'easymotion/vim-easymotion'
  Plug 'elixir-lang/vim-elixir'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'w0ng/vim-hybrid'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-peekaboo'
  Plug 'vim-ruby/vim-ruby'
  Plug 'kshenoy/vim-signature'
  Plug 'mhinz/vim-startify'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  let g:fzf_action = {
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }

call plug#end()
