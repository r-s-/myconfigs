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

"Ctrl-p for fuzzy finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>l :CtrlPTag<cr>
nnoremap <leader>o :CtrlPBuffer<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>ne :NERDTree<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

"Git keys
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gb :Gblame<cr>

" Search keys
nnoremap <leader>f :Ag 

"Navigate splits with vim-line commands
map <Tab> <C-W>

"More standard splits
set splitbelow
set splitright
set scrolloff=3

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
set t_Co=256
" colorscheme hybrid 
colo seoul256

vmap <Leader>z :call I18nTranslateString()<CR>

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

"Nvim terminal commands
if has('nvim')
  tnoremap <Leader>e <C-\><C-n> 
  tnoremap <Esc> <C-\><C-n> 
  nnoremap <Leader>t :tabe<cr>
  nnoremap <Leader>e :term<cr>
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
