g

set nocompatible               " be iMproved
filetype off                   " required!

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/emmet-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'dyng/ctrlsf.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'skammer/vim-css-color'
" gui
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rstacruz/vim-ultisnips-css'


execute pathogen#infect()

filetype plugin indent on     " required!

" color
syntax enable
let g:molokai_original = 1
if has('gui_running')
    "colorscheme monokai 
    colo molokai
else
    "let g:solarized_termcolors=256
    "set background=dark
    "colorscheme solarized
    colo molokai
    let g:rehash256 = 1
    set background=dark
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
set expandtab
set shiftwidth=4     " 敲回车时也是缩进4个
set showmatch        " 括号对应
set incsearch        " 实时显示搜索结果
set wildignore=*.pyc " 打开时过滤的扩展名

" 设置当文件被改动时自动载入
set autoread

" 设置ctrlsf
let g:ctrlsf_ackprg = 'ag'
let g:Powerline_symbols = 'unicode'


" 在文件中启用自动完成
au FileType ruby,coffee setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au FileType javascript,css,html,htmldjango,tpl setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au FileType sass setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab
au BufRead *.wsgi set syntax=python
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType tpl set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au BufRead,BufNewFile Gemfile,Guardfile set syntax=ruby

" 快捷键
map <leader>n :NERDTreeToggle<CR>
map <leader>cc :TCommentBlock<CR>
map <leader>d :JsDoc<CR>

" 自动编译coffee script
au BufWritePost *.coffee silent CoffeeMake!

" js 自动添加文件头
function! HeaderJS()
    call setline(1, '/**')
    call append(1, ' * ')
    call append(2, ' * @Date: ' . strftime('%Y-%m-%d %T', localtime()))
    call append(3, ' * @Author: vfasky (vfasky@gmail.com)')
    call append(4, ' * @Version: $Id$')
    call append(5, ' */')
    normal G
    normal o
    normal o
endfunc
function! InsertCommentJS()
    if a:lastline == 1 && !getline('.')
        call HeaderJS()
    end
endfunc
autocmd bufnewfile *.js call HeaderJS()
au FileType javascript :%call InsertCommentJS()

   
" python 自动添加文件头
function! HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# @Date: " . strftime('%Y-%m-%d %T', localtime()))
    call append(3, "# @Author: vfasky (vfasky@gmail.com)")
    call append(4, "# @Link: http://vfasky.com")
    call append(5, "# @Version: $Id$")
    normal G
    normal o
    normal o
endf
function! InsertCommentPython()
    if a:lastline == 1 && !getline('.')
        call HeaderPython()
    end
endfunc
autocmd bufnewfile *.py call HeaderPython()
au FileType python :%call InsertCommentPython()

" coffee 自动添加文件头
function! HeaderCoffee()
    call setline(1, "###*")
    call append(1, "# ")
    call append(2, "# @date: " . strftime('%Y-%m-%d %T', localtime()))
    call append(3, "# @author: vfasky (vfasky@gmail.com)")
    call append(4, "# @link: http://vfasky.com")
    call append(5, "# @version: $Id$")
    call append(6, "###")
    call append(7, "")
    normal G
    normal o
endf
function! InsertCommentCoffee()
    if a:lastline == 1 && !getline('.')
        call HeaderCoffee()
    end
endfunc
autocmd bufnewfile *.coffee call HeaderCoffee()
au FileType coffee :%call InsertCommentCoffee()

let g:UltiSnipsExpandTrigger = '<c-l>'
" let g:UltiSnipsJumpForwardTrigger = '<c-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" let g:UltiSnipsListSnippets = '<c-m>'
