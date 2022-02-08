set fileformat=unix
if [ -f "$HOME/.vimrc" ];then
    echo "Your '$HOME/.vimrc' is saved as '$HOME/.vimrc.bak'"
    cp $HOME/.vimrc $HOME/.vimrc.bak
fi

echo "Get new '$HOME/.vimrc'"
cp .vimrc $HOME/.vimrc

if [ ! -d "$HOME/.vim/autoload" ];then
    echo "Create $HOME/.vim/autoload"
    mkdir -p $HOME/.vim/autoload
fi
echo "Get $HOME/.vim/autoload/plug.vim"
cp plug.vim $HOME/.vim/autoload/plug.vim
# if [ ! -f "$HOME/.vim/autoload/plug.vim" ];then
#     echo "Downloading vim-plug from github"
#     curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
#         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fi

if [ -f "$HOME/.vim/autoload/plug.vim" ];then
    echo "Install plugins via vim-plug"
    vim $HOME/.vimrc
    echo "comment the .vimrc for Install plugins"
    sed '4 s/^/" /' $HOME/.vimrc > $HOME/.vimrc.buffer && mv $HOME/.vimrc.buffer $HOME/.vimrc
else
    echo "Downloading vim-plug from github failed, please try again"
fi
