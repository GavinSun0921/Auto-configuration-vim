cp .vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim ~/.vimrc
sed '4 {s/^/" /}' ~/.vimrc > ~/.vimrc.buffer && mv ~/.vimrc.buffer ~/.vimrc
