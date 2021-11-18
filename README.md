## Dot Files

This vim setup is always changing and getting to be a very comfortable setup for development.

###### To get started:

    $> git clone https://github.com/sammyteahan/dotfiles.git ~/.vim
    $> cd .vim
    $> git submodule init
    $> git submodule update


###### Create symlink:

    $> ln -s ~/.vim/vimrc ~/.vimrc


###### Add pathogen plugin to git submodules

Do this after cloning a new repo to the `bundle` directory to ensure everything is setup properly here.

    $> git submodule add <remote_url> <destination_folder>


###### Updating all submodules

    $> git submodule foreach git pull origin master

