if [ -f "~/.vimrc" ];then
    echo "Your '~/.vimrc' is saved as '~/.vimrc.bak'"
    cp ~/.vimrc ~/.vimrc.bak
fi

echo "Get new '~/.vimrc'"
cp .vimrc ~/.vimrc
if [ ! -f "~/.vim/autoload/plug.vim" ];then
    echo "Downloading vim-plug from github"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -f "~/.vim/autoload/plug.vim" ];then
    echo "Install plugins via vim-plug"
    vim ~/.vimrc
    echo "comment the .vimrc for Install plugins"
    sed '4 {s/^/" /}' ~/.vimrc > ~/.vimrc.buffer && mv ~/.vimrc.buffer ~/.vimrc
else
    echo "Downloading vim-plug from github failed, please try again"
fi
