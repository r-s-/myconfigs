"Ryan Selk
" .nvimrc
" Intended for use with Neovim
"
"set leader to space
let mapleader = "\<Space>"

"Leader commands
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>o :Buffers<CR>
nnoremap <silent> <leader>ne :NERDTree<cr>
nnoremap <silent> <leader>nf :NERDTreeFind<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>bb :ls<cr>:buffer<Space>
nnoremap <silent> <leader>t :tabe<cr>
nnoremap <silent> <leader>1 :bn<cr>
nnoremap <silent> <leader>0 :bp<cr>
nnoremap <silent> <leader>c :bd<cr>
nnoremap <silent> <leader>ag :Ag 
nnoremap <silent> <leader>r :reg<cr>
nnoremap <silent> <leader>ki :call GitStoryId()<cr>
nnoremap <silent> <leader>so :call ToggleSyntax()<cr>
nnoremap <silent> <leader>ln :set invrnu<cr>
nnoremap <silent> <leader>sl :SidewaysLeft<cr>
nnoremap <silent> <leader>sr :SidewaysRight<cr>
nnoremap <silent> <leader>h :nohlsearch<CR><Esc>
nnoremap <silent> <leader>e :term<cr>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fL :Lines<CR>
nnoremap <silent> <leader>ft :BTags<CR>
nnoremap <silent> <leader>fT :Tags<CR>
nnoremap <silent> <leader>; :Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

"Neovim Terminal Settings
tnoremap <Esc> <C-\><C-n> 
tnoremap <C-W>h <C-\><C-n><C-w>h
tnoremap <C-W>j <C-\><C-n><C-w>j
tnoremap <C-W>k <C-\><C-n><C-w>k
tnoremap <C-W>l <C-\><C-n><C-w>l
autocmd WinEnter term://* startinsert

"Easy Motion Search
map <Space><Space> <Plug>(easymotion-prefix)

" Y behave like D or C
nnoremap Y y$

"Search and Replace Settings
set ignorecase 
set smartcase 
set gdefault 

"Switch ; and : keys
nnoremap ; :
nnoremap : ;

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

"More standard splits
set splitbelow
set splitright
set scrolloff=2

"keep the visual selection active after indenting.
vmap > >gv
vmap < <gv

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

"These settings can speed up vim
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw

"vim-plug for easy cross machine plugin handling
call plug#begin('~/.nvim/plugged')

  " Language Specific
  Plug 'elixir-lang/vim-elixir'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'ap/vim-css-color'
  Plug 'vim-ruby/vim-ruby'

  " Navigation
  Plug 'rhysd/clever-f.vim'
  Plug 'scrooloose/nerdtree'

  " Added Functionality
  Plug 'rking/ag.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-endwise'
  Plug 'kshenoy/vim-signature'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-fugitive'
    let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
  Plug 'junegunn/vim-peekaboo'
    let g:peekaboo_delay = 600
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
    let g:fzf_layout = { 'up': '~20%' }

  " Style
  Plug 'w0ng/vim-hybrid'
  Plug 'tpope/vim-commentary'
  Plug 'kien/rainbow_parentheses.vim'

call plug#end()

" Custom Functions
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

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set background=dark
colorscheme hybrid

