# Dotfiles

This is a forked repo from [Roger Leite](https://github.com/rogerleite)'s dot f*** files for Mac and Linux users.

## Vim Instalation

First of all you need to clone the repo
```sh
cd ~
git clone https://github.com/wjsantos/Dotfiles.git
```

Than the the submodules
```sh
cd Dotfiles
git submodule init
git submodule update
```
Link it to your .vim and .vimrc and be happy
```sh
ln -s ~/Dotfiles/.vim ~/.vim
ln -s ~/Dotfiles/.vimrc ~/.vimrc
```

