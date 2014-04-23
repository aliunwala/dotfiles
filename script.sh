clear
echo "Removing .vim .vimrc .vimperatorrc"
rm -rf ~/.vim ~/.vimrc ~/.vimperatorrc ~/.gvimrc
echo "Adding back .vim .vimrc .vimperatorrc"
cp -r ./.vimrc ./.vim ./.vimperatorrc ./.gvimrc ~/
exit 0
