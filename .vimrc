"Ryans .vimrc file

"show line numbers
set number

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

"Highlight single character when line surpases 80 characters
highlight ColorColumn ctermbg=green
call matchadd('ColorColumn', '\%81v', 100)

