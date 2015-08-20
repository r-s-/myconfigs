"Ryan Selk's .vimrc

"Pathogen for plugin managment
call pathogen#infect()
call pathogen#helptags()

"set leader to space
let mapleader = "\<Space>"

"custom leader commands
nnoremap <leader>p :CtrlP<cr>
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
nnoremap <leader>ggs :GitGutterToggle<cr>:GitGutterLineHighlightsToggle<cr>
nnoremap <leader>f :Ag 
nnoremap <leader>r :reg<cr>
nnoremap <leader>in :call I18nTranslateString()<cr>
nnoremap <leader>gu :GundoToggle<cr>
nnoremap <leader>ki :call GitStoryId()<cr>
nnoremap <leader>so :call ToggleSyntax()<cr>

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

"Allow toggle between regular and relative numbers
nnoremap <C-N> :set invrnu<cr>

filetype on
filetype plugin indent on
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
syntax on

"map jj to switch out of insert mode
imap jj <Esc>

"swap
set noswapfile

"Switch ; and : keys
nnoremap ; :
nnoremap : ;

"Ctrl-p for fuzzy finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/tmp/*,*.so,*.swp,*.zip    

" Git gitter default settings
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 0

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
colorscheme hybrid 
" colo seoul256


" autocmd BufNewFile,BufRead Gemfile set filetype=ruby
" autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

"Nvim terminal commands
if has('nvim')
  tnoremap <Leader>e <C-\><C-n> 
  tnoremap <Esc> <C-\><C-n> 
  nnoremap <leader>e :term<cr>
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

"These settings can speed up vim
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw

"Custom Ctrl-p settings
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:14,results:12'
let g:ctrlp_show_hidden = 1

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

nnoremap <leader>s :call ToggleSyntax()<CR>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

