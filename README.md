## Dot Files

This vim setup is always changing and getting to be a very comfortable setup for development.

###### To get started:

    $> git clone https://github.com/sammyteahan/dotfiles.git ~/.vim
    $> cd .vim
    $> git submodule init
    $> git submodule update


###### Create symlink:

    $> ln -s ~/.vim/vimrc ~/.vimrc


###### Updating submodules

    $> git submodule foreach git pull origin master

