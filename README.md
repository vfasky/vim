vim 插件配置同步
===

## 安装 

```
git clone  git@github.com:vfasky/vim.git ~/.vim --recursiv
ln -s ~/.vim/.vimrc ~/.vimrc
vim +BundleInstall
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh
```
