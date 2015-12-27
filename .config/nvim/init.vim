scriptencoding utf-8

"Ryan Selk
" .nvimrc
"
" Intended for use with Neovim
runtime macros/matchit.vim
" =============================================================================
" General Key Remappings
" =============================================================================
let mapleader = "\<Space>"
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
nnoremap <silent> <Leader>ws :keeppatterns %s/\s\+$//<CR>

" Have . work on visual lines
vnoremap . :norm.<CR>

nnoremap ; :
nnoremap : ;
imap jj <Esc>

" =============================================================================
" Neovim Terminal Remappings
" =============================================================================
map <Tab> <C-W>

"Tmux style maximize
nnoremap <silent> <C-W>m :call MaximizeToggle()<CR>
nnoremap <silent> <C-W>= :call ResetStateCallEqual()<CR>
 

autocmd WinEnter term://* startinsert

" =============================================================================
" Vim Preferences
" =============================================================================

" Y behave like D or C
nnoremap Y y$

" Search and Replace
set ignorecase 
set smartcase 
set gdefault 

" Tab
set tabstop=2 shiftwidth=2 expandtab

" Numbering
set number
set relativenumber
set autoread
set hidden

" Indentation
set cindent
set shiftwidth=2
set autoindent
filetype on
filetype plugin indent on
" syntax on

" Swap
set noswapfile

" Window Splitting
set splitbelow
set splitright
set scrolloff=2

" Keep the visual selection active after indenting.
vmap > >gv
vmap < <gv

"Undo history
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Allow backspace to delete in insert mode
set backspace=2

" =============================================================================
" Style
" =============================================================================

set t_Co=256
" Autocomplete 
highlight Pmenu ctermfg=black ctermbg=white
highlight PmenuSel ctermfg=red  ctermbg=grey

" Line Numbers
highlight LineNr ctermfg=grey
hi Visual ctermbg=20

" =============================================================================
" Performance
" =============================================================================
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set re=1

" =============================================================================
" Vim-Plug
" =============================================================================
call plug#begin('~/.nvim/plugged')
  Plug 'elixir-lang/vim-elixir'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'ap/vim-css-color'
  Plug 'vim-ruby/vim-ruby'
  Plug 'scrooloose/nerdtree'
  Plug 'rking/ag.vim'
  Plug 'easymotion/vim-easymotion'
    map <Space><Space> <Plug>(easymotion-prefix)
  Plug 'tpope/vim-endwise'
  Plug 'kshenoy/vim-signature'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
    let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
  Plug 'junegunn/vim-peekaboo'
    let g:peekaboo_delay = 800
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
    let g:fzf_layout = { 'up': '~20%' }

  Plug 'w0ng/vim-hybrid'
  Plug 'tpope/vim-commentary'
  Plug 'kien/rainbow_parentheses.vim'

  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'bling/vim-airline'
  " {{{
  let g:airline_left_sep  = '▓▒░'
  let g:airline_right_sep = '░▒▓'
  let g:airline_section_z = '%2p%% %2l/%L:%2v'
  let g:airline#extensions#syntastic#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_exclude_preview = 1

  Plug 'idanarye/vim-merginal'
    nnoremap <leader>gm :MerginalToggle<CR>
  Plug 'ryanss/vim-hackernews'
  Plug 'christoomey/vim-tmux-navigator'


call plug#end()

" =============================================================================
" Custom Functions
" =============================================================================

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

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

let g:loaded_matchparen=1

" Maximize splits similar to Tmux
function! MaximizeToggle()
  if exists("s:maximize_session")
    exe "normal! \<C-W>="
    unlet s:maximize_session
  else
    exe "normal! \<C-W>_\<C-W>|"
    let s:maximize_session = "active"
  endif
endfunction

function! ResetStateCallEqual()
  if exists("s:maximize_session")
    exe "normal! \<C-W>="
    unlet s:maximize_session
  else
    exe "normal! \<C-W>="
  endif
endfunction

" Cursorline on active window
autocmd VimEnter,WinEnter * call s:active_ui()
autocmd WinLeave * call s:inactive_ui()
function! s:active_ui()
  set cursorline
endfunction
  set colorcolumn=
function! s:inactive_ui()
  set nocursorline
endfunction

