"My Vimrc config file

source /Users/dominicipoinelli/.vim/vim-plug.vim
source /Users/dominicipoinelli/.vim/general_sets.vim
source /Users/dominicipoinelli/.vim/mapping.vim
source $HOME/.vim/highlights.vim

"=-=-=-=-=- Opts for the header 42 =-=-=-=-=-=-=-=-=-=-=

let g:user42 = 'gdominic'
let g:mail42 = 'gdominic@student.42barcelona.com'

"*******************NERDTREE PLUGINS CONF**********************
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=3
let NERDTreeCascadeOpenSingleChildDir=0

"=-=-=-=-=-=-=- NERD TREE INCLUDE IN VIM =-=-=-=-=-=-=-=-=-
"let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_liststyle=3
"let g:netrw_preview=1
"let g:netrw_winsize=10


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


"Load all packages
packloadall
silent! helptags ALL
