#!/bin/bash

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# sym link for .zshrc
rm /root/.zshrc
ln -s /shared/zsh/.zshrc /root/.zshrc
# sym link for dash.plugin.zsh
mkdir ~/.oh-my-zsh/custom/plugins/dash
ln -s /shared/zsh/dash.plugin.zsh ~/.oh-my-zsh/custom/plugins/dash/dash.plugin.zsh
# sym link for binds.plugin.zsh
mkdir ~/.oh-my-zsh/custom/plugins/binds
ln -s /shared/zsh/binds.plugin.zsh ~/.oh-my-zsh/custom/plugins/binds/binds.plugin.zsh
