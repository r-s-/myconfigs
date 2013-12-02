"Ryans .vimrc file

set number

"GO settings
filetype off
filetype plugin indent off
set runtimepath+=~/go/misc/vim
filetype plugin indent on
syntax on
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

"Change Backup Directory
set nobackup 

set nocompatible 
"map jj to switch out of insert mode 
:imap jj <Esc>

"Auto indentation
:set cindent
:set shiftwidth=2
:set autoindent

"Switch ; and : keys to save keystrokes
nnoremap ; :
nnoremap : ;

"Auto Add braces ({{ to add single brace)
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Tabing to change window
nnoremap <tab><tab> <c-w>w


"Highlight single character when line surpases 80 characters
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)

