" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

set tabstop=4
set shiftwidth=4
set textwidth=79

set number "line number
set ruler

set showcmd
set autoindent
set smartindent
set wrap 

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"syntax highlight 
syntax on

"vundle
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"-------------------------------
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-syntastic/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
"--------------------------------
filetype plugin indent on

"YCM 设置
set completeopt=longest,menu " 关掉补全时的预览窗口
let g:ycm_min_num_of_chars_for_completion = 2 " 两个字开始补全
let g:ycm_complete_in_comments = 1                " 评论中也应用补全
let g:ycm_show_diagnostics_ui = 0               " 关闭ycm的syntastic

"syntastic 
let g:syntastic_quiet_messages = { "type": "style" }

" nerdtree set
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
""窗口大小"
let NERDTreeWinSize=25

" set tagbar
map <F3> :TagbarToggle<CR>
let g:tagbar_compact = 1

""""""quick run"""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
        exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		  :!time bash %
	elseif &filetype == 'python'
		exec "!time python3 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
"        exec "!go build %<""
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	elseif &filetype == 'perl'
		exec "!time perl %"
	endif
endfunc

