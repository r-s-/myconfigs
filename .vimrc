call pathogen#infect()
call pathogen#helptags()

set number
set relativenumber

filetype on
filetype plugin indent on
au BufNewFile,BufRead *.rs set filetype=rust
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

syntax on

"map jj to switch out of insert mode
:imap jj <Esc>

"Auto indentation
:set cindent
:set shiftwidth=2
:set autoindent

"swap
:set noswapfile
"Switch ; and : keys to save keystrokes
nnoremap ; :
nnoremap : ;

"Auto Add braces ({{ to add single brace)
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

"Tabing to change window
nnoremap <tab><tab> <c-w>w

"Highlight single character when line surpases 80 characters
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)

"Ctrl-p for fuzzy finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1 "use .* for wildcard

"NERDTree shortcuts
:command NE NERDTree
:command NF NERDTreeFind

"Navigate splits with vim-line commands
nnoremap <Tab>j <C-W><C-J>
nnoremap <Tab>k <C-W><C-K>
nnoremap <Tab>l <C-W><C-L>
nnoremap <Tab>h <C-W><C-H>

"More standard splits
set splitbelow
set splitright

nnoremap <C-N> :set invrnu<cr>

" keep the visual selection active after indenting.
vmap > >gv
vmap < <gv
