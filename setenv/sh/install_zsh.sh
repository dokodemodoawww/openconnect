#!/bin/sh

zsh --version
sudo yum -y install zsh
echo $SHELL
echo /bin/zsh >> /etc/shells
sudo chsh

cd ~
sudo rm -rf ~/.zsh
git clone https://github.com/takumainoue/.zsh.git
ln -s ~/.zsh/.zshrc ~/.zshrc
source ~/.zshrc

