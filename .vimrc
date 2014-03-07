" Vundle cofnig

set nocompatible               " be iMproved
filetype off                   " required!

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-sensible'

execute pathogen#infect()

filetype plugin indent on     " required!

" color
let g:solarized_termcolors=256
syntax enable
if has('gui_running')
	colorscheme monokai 
else
	set background=dark
	colorscheme solarized
endif

" base set 
set encoding=utf-8
set nospell
set nu " line number
set smartindent
set ls=2
set path=.,,**
" 设置默认字体  
if has('mac')
	set guifont=Source\ Code\ Pro\:h20 
else
	set guifont=Source\ Code\ Pro\ 18
endif
set autochdir

" 设置当前行高亮, cursorline
set cul 

" 显示缩进tab线  
set list lcs=tab:\|\  
set tabstop=4        " 用TAB键一次4个空格
set shiftwidth=4     " 敲回车时也是缩进4个
set showmatch        " 括号对应
set incsearch        " 实时显示搜索结果
set wildignore=*.pyc " 打开时过滤的扩展名

" 设置当文件被改动时自动载入
set autoread

" 在文件中启用自动完成
au FileType ruby,coffee setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au FileType javascript,css,html,htmldjango setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au FileType sass setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au BufRead *.wsgi set syntax=python
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au BufRead,BufNewFile Gemfile,Guardfile set syntax=ruby
