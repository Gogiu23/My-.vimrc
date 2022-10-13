let g:user42 = 'gdominic'
let g:mail42 = 'gdominic@student.42barcelona.com'
set history=1000
set backspace=indent,eol,start
"*************HIGHLIGHTS************************
hi Search cterm=bold ctermfg=red ctermbg=yellow
hi IncSearch cterm=bold ctermfg=black ctermbg=red
hi CurSearch term=bold ctermfg=white ctermbg=red
hi LineNrAbove ctermfg=green
hi LineNrBelow ctermfg=red
hi CursorLineNr ctermfg=white
hi StatusLine cterm=bold ctermfg=black ctermbg=white
hi LineNrBelow term=bold ctermfg=red ctermbg=black
hi CursorLine term=standout cterm=bold ctermbg=17
hi SpellLocal cterm=underline ctermfg=Blue
hi Error term=standout cterm=bold ctermbg=124 ctermfg=15
hi StorageClass term=standout cterm=bold ctermfg=118 ctermbg=235

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set statusline=%#Error#
set statusline+=%3f 					"Path to the file
set statusline+=\ |						"Separator
set statusline+=%#StorageClass#
set statusline+=\ |						"Separator
set statusline+=Filetype:			"Label (is personal)
set statusline+=%4Y						"the type of file we are editing
"Call funuction to execute the git
set statusline+=%{StatuslineGit()}
"Sapce between
set statusline+=\  |
"Used to indicates that the follows indicators must go on the right
set statusline+=%=
set statusline+=%#StatusLineTerm#		"Type of color assigned to the group
set statusline+=%#CursorLine#
set statusline+=\  |
set statusline+=Percent:%p%%				"percentatge of file
set statusline+=\  |
set statusline+=\  |
set statusline+=C/Line:%-3l				"Current line
set statusline+=\ |						"Separator
set statusline+=T/L:%-4L				"Total lines
set statusline+=\ |						"Separator
set statusline+=Columns:%-2c
set statusline+=\ |						"Separator
set relativenumber
set laststatus=2
set number
syntax enable
set autoindent
set cursorline
set smartindent
set noswapfile
set ttyfast
nohl
set hlsearch
set nobackup
set encoding=utf8
set noexpandtab shiftwidth=4 tabstop=4
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

"=========================KEYMAPS============================================

"OPEN VIMRC IN A FLY AND SOURCE IT
"*********************************
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>e :source $MYVIMRC<cr>

"SAVING TEXT
"************
nnoremap <C-s> :w<CR>
nnoremap <C-z> :wqa<CR>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap L <end>
nnoremap H <home>
nnoremap <Down> <nop>
nnoremap <Up> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

"MOVING TEXT *
"*************
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

"RESIZE WINDOWS*
"***************
nnoremap <C-k>    :resize +2<CR>
nnoremap <C-j>  :resize -2<CR>
nnoremap <C-l>  :vertical resize -2<CR>
nnoremap <C-h> :vertical resize +2<CR>
nnoremap <C-q> :bd<CR>
nnoremap <Space> :NERDTreeToggle<CR>

"Load all packages
packloadall
silent! helptags ALL
