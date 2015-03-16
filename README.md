brew install hg ag git
gie clone https://github.com/zeast/vim-configure.git
cp vim-configure/vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "PluginInstall"
