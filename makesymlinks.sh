#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# (I copied this file from the guide on http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc bashrc inputrc latexmkrc"    # list of files/folders to symlink in homedir

##########


# In the list of file...
for file in $files; do

    # ... check for already existing files which are not symbolic links...
    if [ -f ~/.$file ] && [ ! -L ~/.$file ]; then

        # ... In this case, delete dotfiles_old directory in homedir, if it exists...
        if [ -d $olddir ]; then
            echo "Removing existing $olddir directory..."
            rm -r -f $olddir
            echo "... done."
        fi

        # ... then create a new empty one
        echo "Creating $olddir for backup of any existing dotfiles in ~/ ..."
        mkdir -p $olddir
        echo "... done."
    fi
done

# change to the dotfiles directory
echo "Changing to the $dir directory..."
cd $dir
echo "... done."

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -f ~/.$file ] && [ ! -L ~/.$file ]; then
        echo "Moving existing dotfile .$file from ~ to $olddir"
        mv ~/.$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    elif [ -L ~/.$file ] && [ -L ~/.$file ]; then
        echo "Replacing symlink to $file in home directory."
        ln -sf $dir/$file ~/.$file
    else
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done
