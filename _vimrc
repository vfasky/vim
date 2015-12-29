" python env
let g:python_host_prog = '/usr/bin/python'

" NeoBundle Scripts
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" 设置安装插件超时
let g:neobundle#install_process_timeout = 1800  "YouCompleteMe is so slow


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" colorschemes
NeoBundle 'flazz/vim-colorschemes'

"NeoBundle 'vim-scripts/Conque-Shell'
"NeoBundle 'Shougo/vimshell.vim'

" 自动补全
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer'
    \ }
\ }
"NeoBundle 'marijnh/tern_for_vim', {
    "\ 'build'  : {
        "\ 'mac' : 'npm install'
    "\ }
"\ }
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'othree/tern_for_vim_coffee'

" 快速跳转
NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'tacahiroy/ctrlp-funky'

" 快速书写html <C-y>,  触发
NeoBundle 'mattn/emmet-vim'

" 自动补全：(), [], {}, <>
NeoBundle 'Raimondi/delimitMate'

" 自动关闭html, xml标签
NeoBundle 'alvan/vim-closetag'

" 高亮显示匹配的标签
NeoBundle 'Valloric/MatchTagAlways'

" 经典主题
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

" 高亮显示文档中颜色代码
NeoBundle 'gorodinskiy/vim-coloresque'

" 底部状态栏
NeoBundle 'bling/vim-airline'

" 目录树导航
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

" 光标定位在方法上面，自动生成js doc
NeoBundle 'heavenshell/vim-jsdoc'

" js高亮
NeoBundle 'othree/yajs.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'

" css高亮
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'

" md高亮
NeoBundle 'tpope/vim-markdown'

" coffeey高亮
NeoBundle 'kchmck/vim-coffee-script'

" 语法检查
NeoBundle 'scrooloose/syntastic'

" JSON 相关
NeoBundle 'elzr/vim-json'
NeoBundle 'XadillaX/json-formatter.vim'

" git
NeoBundle 'tpope/vim-fugitive'

" 缩进 
NeoBundle 'nathanaelkane/vim-indent-guides'

" 代码片段
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'rstacruz/vim-ultisnips-css'

" 代码格式化
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'

" 注释
"<leader>cc 加上注释
"<leader>cu 解开注释
"<leader>ci 加上/解开注释
NeoBundle 'scrooloose/nerdcommenter'

" 查找
NeoBundle 'dyng/ctrlsf.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" Installation check.
NeoBundleCheck

syntax enable

""" 插件设置 """

"vim-javascript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_enable_domhtmlcss  = 1

" ctrlp
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|swp|so|dll|jpg|png|gif|bmp|zip|tar|tar.gz|pyc)$',
    \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" 如果安装了ag, 使用ag
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" ctrlpfunky
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" let g:ctrlp_funky_syntax_highlight = 1
" let g:ctrlp_extensions = ['funky']

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery,requirejs'

" tren
let g:tern_map_keys = 1
"let g:tern_show_argument_hints = 'on_hold'

" 语法检查配置
" 依赖 npm install -g jshint
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']

let g:airline_powerline_fonts = 1

" 可视化缩进随 vim 启动
let g:indent_guides_enable_on_vim_startup = 1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level = 2
" 色块宽度
let g:indent_guides_guide_size = 1

" 代码片段快捷Ctrl+e
let g:UltiSnipsExpandTrigger="<C-E>"
"let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" scss
au BufRead,BufNewFile *.scss set filetype=scss.css

" coffee
autocmd FileType coffee nnoremap <leader>p :CoffeeWatch vert<cr>

" tern
autocmd FileType javascript setlocal completeopt-=preview
autocmd FileType javascript nnoremap <leader>jd :TernDef<cr>
autocmd FileType javascript nnoremap <leader>jr :TernRefs<cr>

" 代码格式化设置
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" 选中格式化
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" YCM
set completeopt-=preview
let g:ycm_semantic_triggers = {
    \ 'coffee': ['.']
\}
let g:ycm_add_preview_to_completeopt = 0
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1  
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1   
" 提示UltiSnips
let g:ycm_use_ultisnips_completer = 1 
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1   
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1 

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" nnoremap <leader>jd :YcmCompleter GoTo<CR>

" jsdoc
let g:jsdoc_allow_input_prompt = 1

""" 环境变量 """

" 主题
if has('gui_running')
    "set background=light
    "colorscheme solarized
    let g:hybrid_use_Xresources = 1
    colorscheme hybrid
    " 高亮当前行
    set cursorline
else
    colo molokai
    let g:rehash256 = 1
    let g:molokai_original = 1
    set background=dark
endif

" 设置默认字体  
if has('mac')
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
elseif has('win32')
    set guifont=Source_Code_Pro_Light:h14:cANSI,YaHei\ Consolas\ Hybrid:h14
else
    set guifont=Source\ Code\ Pro\ 14
endif

" 自动设换到当前目录
set autochdir

" 指定shell
"set shell=zsh\ -i
"set shell=/bin/zsh\ -l
"set shellcmdflag=-ic

" 制表符
set modifiable
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 行控制
" set linebreak
" set textwidth=80
set nocompatible
set wrap

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 查找时忽略大小写
set ignorecase
set incsearch
set hlsearch

" 关闭备份
set nobackup
" 关闭交换文件
set noswapfile

" 在所有模式下都允许鼠标
set mouse=a

" 80 列辅助线
set cc=80
set cc+=120

"if has("gui_macvim")
    "" 中文输入法问题
    "" - 偏好设置界面里面（按 ⌘+,），把 Draw marked text inline 这个选项去掉
    "set noimdisable
    "autocmd! InsertLeave * set imdisable|set iminsert=0
    "autocmd! InsertEnter * set noimdisable|set iminsert=0
"endif

""" 快捷键 """
"map <leader>n :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>d :JsDoc<CR>




" 打开 vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
" 执行 vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" 用双引号括当前单词
nnoremap <leader>" viw<esc>i"<esc>hbi"<esc>lel
" 用单引号括当前单词
nnoremap <leader>' viw<esc>i'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>i(<esc>hbi)<esc>lel


"""自动文档配置"""
let g:doc_author = 'vfasky <vfasky@gmail.com>'
let g:doc_link   = 'http://vfasky.com'

" js 自动添加文件头
function! HeaderJS()
    call setline(1, '/**')
    call append(1, ' * ')
    call append(2, ' * @date ' . strftime('%Y-%m-%d %T', localtime()))
    call append(3, ' * @author ' . g:doc_author)
    call append(4, ' */')
    normal G
    normal o
    normal o
endfunc
function! InsertCommentJS()
    if a:lastline == 1 && empty(getline(a:lastline))
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
    call append(3, "# @Author: " . g:doc_author)
    call append(4, "# @Link: " . g:doc_link)
    normal G
    normal o
    normal o
endf
function! InsertCommentPython()
    if a:lastline == 1 && empty(getline(a:lastline))
        call HeaderPython()
    end
endfunc
autocmd bufnewfile *.py call HeaderPython()
au FileType python :%call InsertCommentPython()

" coffee 自动添加文件头
function! HeaderCoffee()
    call setline(1, "\#\#\#*")
    call append(1, "\# ")
    call append(2, "\# @date " . strftime('%Y-%m-%d %T', localtime()))
    call append(3, "\# @author " . g:doc_author)
    call append(4, "\# @link " . g:doc_link)
    call append(5, "\#\#\#")
    call append(6, "'use strict'")
    normal G
    normal o
    normal o
endf
function! InsertCommentCoffee()
    if a:lastline == 1 && empty(getline(a:lastline))
        call HeaderCoffee()
    end
endfunc
autocmd bufnewfile *.coffee call HeaderCoffee()
au FileType coffee :%call InsertCommentCoffee()

" 自动编译coffee script
autocmd BufWritePost *.coffee silent make! --bare

" 定义函数AutoSetFileHead，自动插入文件头
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    normal G
    normal o
    normal o
endfunc
autocmd BufNewFile *.sh exec ":call AutoSetFileHead()"


"aug coffee
    "au!
    "au BufNewFile,BufRead *.coffee      setf coffee.python
    "au FileType coffee.python           setl makeprg=coffee\ -c\ %
    "au FileType coffee.python           setl errorformat=Error:\ In\ %f\\,\ %m\ on\ line\ %l,
                                                       "\Error:\ In\ %f\\,\ Parse\ error\ on\ line\ %l:\ %m,
                                                       "\SyntaxError:\ In\ %f\\,\ %m,
                                                       "\%-G%.%#
    "au BufWritePost *.coffee silent! make!

"aug END


