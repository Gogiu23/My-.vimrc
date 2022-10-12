let g:user42 = 'gdominic'
let g:mail42 = 'gdominic@student.42barcelona.com'
set relativenumber
set number
syntax enable
set autoindent
set list
set history=1000
set columns
set confirm
set cursorline
set smartindent
set noswapfile
set termguicolors=true
set ttyfast
set encoding=utf8
set noexpandtab shiftwidth=4 tabstop=4
hi LineNrAbove ctermfg=green
hi LineNrBelow ctermfg=red
hi CursorLineNr ctermfg=white
hi Comment gui=italic
hi Normal guibg = #001a33
"=========================KEYMAPS============================================
"************
"SAVING TEXT
"************
nnoremap <C-s> :w<CR>
"*************
"MOVING TEXT *
"*************
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
"***************
"RESIZE WINDOWS*
"***************
nnoremap <C-k>    :resize +2<CR>
nnoremap <C-j>  :resize -2<CR>
nnoremap <C-l>  :vertical resize -2<CR>
nnoremap <C-h> :vertical resize +2<CR>

