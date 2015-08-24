## Dot Files

I don't ever put anything in my .vimrc that I don't understand. This vim setup is always changing and getting to be a very comfortable setup for development.

###### To get started:

    $> git clone https://github.com/sammyteahan/dotfiles.git ~/.vim
    $> git submodule init
    $> git submodule update
    $> cd ~/.vim/bundle/YouCompleteMe
    $> ./install.sh (need to brew install cmake for this)


###### YouCompleteMe

This package is a little bit special. You're going to need to have the cmake package installed (brew install cmake).

    $> cd ~./vim/bundle/YouCompleteMe
    $> git submodule update --init --recursive
    $> ./install.sh


###### Create symlink:

    $> ln -s ~/dotfiles/vimrc ~/.vimrc

