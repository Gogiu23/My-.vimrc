let g:user42 = 'gdominic'
let g:mail42 = 'gdominic@student.42barcelona.com'
set history=1000
set backspace=indent,eol,start
syntax enable
set nocompatible
set wildmenu
set wildoptions=pum
set path+=**
filetype plugin on
set relativenumber
set laststatus=2
set number
set autoindent
set cursorline
set smartindent
set noswapfile
set splitright
set wildmode=full
set complete-=i
set foldlevelstart=2
set ttyfast
set showcmd ruler laststatus=2
nohl
set hlsearch
set nobackup
set encoding=utf8
set noexpandtab shiftwidth=4 tabstop=4
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
command! MakeTags !ctags -R .
"
"*******************NERDTREE PLUGINS CONF**********************
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=3
let NERDTreeCascadeOpenSingleChildDir=0

"############## NERD TREE INCLUDE IN VIM ##################
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_winsize=10

"************* TERM SIZE WINDOWS ***********************
set termwinsize=10*0
nnoremap <leader>t :below terminal<CR> 

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
hi DIffDelete term=standout cterm=bold ctermfg=15
hi ModeMsg term=standout cterm=bold ctermfg=15 ctermbg=25 
hi Number term=standout cterm=bold ctermfg=172
hi Character term=standout cterm=bold  ctermfg=208
colorscheme habamax  
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
set statusline+=%#DiffDelete#
set statusline+=\ |						"Separator
set statusline+=Filetype:			"Label (is personal)
set statusline+=%4Y						"the type of file we are editing
"Call funuction to execute the git
set statusline+=\ |						"Separator
set statusline+=%#StorageClass#
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

"=========================KEYMAPS============================================

"OPEN VIMRC IN A FLY AND SOURCE IT
"*********************************
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>e :source $MYVIMRC<cr>

"MOVING FASTER BETWEEN TABS AND BUFFS
"***********************************
nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bp<CR>

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

"REMAPS FOR PLUGINS
"NerdTree
nnoremap <Space> :NERDTreeToggle<CR>

"Fzf
nnoremap <C-f> :Files<CR>


"Load all packages
packloadall
silent! helptags ALL
