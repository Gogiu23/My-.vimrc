"My Vimrc config file
call plug#begin()

"check errors and pre processing code
Plug 'https://github.com/dense-analysis/ale.git'

"colorscheme nightfly
Plug 'https://github.com/bluz71/vim-nightfly-colors.git'

"ycm vim
Plug 'https://github.com/ycm-core/YouCompleteMe.git'

call plug#end()

"Opts for the header 42
let g:user42 = 'gdominic'
let g:mail42 = 'gdominic@student.42barcelona.com'


"=-=-=-=-=-=-=-=-=-=-=- CONFIG YCM =-=-=-=-=-=-=-=-=-=-=-=-
let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_inlay_hints=1
hi link YcmInlayHint Comment
let g:ycm_enable_inlay_hints=1

"-=-=-=-=-=-=-=-=-=-=- GENERAL USE FOR VIM =-=-=-=-=-=-=-=
set history=300
set spell
set backspace=indent,eol,start
syntax enable
set nocompatible
set wildmenu
set wildmode=full
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
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
command! MakeTags !ctags -R .
let g:lightline = { 'colorscheme': 'nightfly' }
"
"Function for moving between tabs and buffers
"
function! TheNext()
	if exists ( '*tabpagenr' ) && tabpagenr('$') != 1
		normal gt
	else
		execute ":bnext"
	endif
endfunction

function! Theprev()
	if exists ( '*tabpagenr' ) && tabpagenr('$') != 1
		normal gT
	else
		execute ":bprev"
	endif
endfunction
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
set termwinsize=30*0
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
colorscheme nightfly 
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
nnoremap <A-l> :call TheNext()<CR>
nnoremap <A-h> :call Theprev()<CR>

"SAVING TEXT
"************
nnoremap <C-s> :w<CR>
nnoremap <C-z> :wqa<CR>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap L <end>
nnoremap H <home>
nmap <Down> <nop>
nmap <Up> <nop>
nmap <Left> <nop>
nmap <Right> <nop>

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

autocmd BufNewFile * :Stdheader

"Load all packages
packloadall
silent! helptags ALL
