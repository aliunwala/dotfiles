jlear
echo "Removing .vim .vimrc .vimperatorrc"
rm -rf ~/.vim ~/.vimrc ~/.vimperatorrc ~/.gvimrc
echo "Adding back .vim .vimrc .vimperatorrc"
cp -r ./.vimrc ./.vim ./.vimperatorrc ./.gvimrc ~/
echo "Adding commands to bashrc"
rm -rf ~/bin
cp -r ./bin ~/
echo "source ~/bin/.bashrcStuff" >> ~/.bashrc
exit 0
