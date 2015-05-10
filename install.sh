ln -s ~/.vim/_vimrc ~/.vimrc

# 安装jshint
npm install -g jshint

# 安装neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang --omnisharp-completer

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

vim +NeoBundleInstall
cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive
