#set -e

brew install emacs

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew tap caskroom/cask
brew install caskroom/cask/brew-cask


printf "password: "
read password
echo "$password" | sudo -S command

if [ -d "~/src" ]; then
  rm -rf ~/src
fi
if [ -d "~/src/takumainoue" ]; then
  rm -rf ~/src/takumainoue
fi

  mkdir ~/programmercollege
  mkdir ~/programmercollege/github
  mkdir ~/programmercollege/github/internousdevdoc
  mkdir ~/programmercollege/github/internousdevjava
  mkdir ~/programmercollege/github/internousdevwork
  mkdir ~/programmercollege/github/internousdevmaster
  mkdir ~/programmercollege/github/homedir

cd ~/programmercollege/github/homedir
sudo git clone https://github.com/takumainoue/.sh
sudo git clone https://github.com/takumainoue/release-internousdevmaster
sudo git clone https://github.com/takumainoue/release-internousdevwork
sudo git clone https://github.com/takumainoue/.bat
sudo git clone https://github.com/takumainoue/openconnect
sudo git clone https://github.com/takumainoue/.ssh
sudo git clone https://github.com/takumainoue/.sql

#which zsh > /dev/null 2>&1
#if[ $1 -eq 0 ]; then
#  zsh --version
#else
#  yes | brew install zsh
brew install zsh
  echo $SHELL
  echo /bin/zsh >> /etc/shells
  sudo chsh
#fi

sudo git clone https://github.com/takumainoue/.zsh

if [ -f "~/.zshrc" ]; then
  rm ~/.zshrc
fi
#if[ -d "~/.zsh" ]; then
  sudo rm -rf ~/.zsh
  unlink ~/.zshrc
  ln -s ~/programmercollege/github/homedir/.zsh/.zshrc ~/.zshrc
  source ~/programmercollege/github/homedir/.zsh/.zshrc ~/.zshrc

#fi

sudo git clone https://github.com/takumainoue/.war
#sudo git clone https://github.com/takumainoue/.emacs.d
sudo git clone https://github.com/takumainoue/init
sudo git clone https://github.com/takumainoue/.internousdb
sudo git clone https://github.com/takumainoue/JissenKadai1_1
sudo git clone https://github.com/takumainoue/JissenKadai1_2
sudo git clone https://github.com/takumainoue/JissenKadai2
sudo git clone https://github.com/takumainoue/JissenKadai3
sudo git clone https://github.com/takumainoue/workspace
sudo git clone https://github.com/takumainoue/internousdev-com
sudo git clone https://github.com/takumainoue/internous-database-connector
sudo git clone https://github.com/takumainoue/internous-rateexchanger
sudo git clone https://github.com/takumainoue/internous-creditcard
sudo git clone https://github.com/takumainoue/KisoKadai1
sudo git clone https://github.com/takumainoue/KisoKadai2
sudo git clone https://github.com/takumainoue/KisoKadai3
sudo git clone https://github.com/takumainoue/project-docs
sudo git clone https://github.com/takumainoue/eclipse
sudo git clone https://github.com/takumainoue/struts2
sudo git clone https://github.com/takumainoue/prototype
sudo git clone https://github.com/takumainoue/gsession
sudo git clone https://github.com/takumainoue/jenkins
sudo git clone https://github.com/takumainoue/tomcat8
sudo git clone https://github.com/takumainoue/dotfiles
sudo git clone https://github.com/takumainoue/.dropbox-internousdev
sudo git clone https://github.com/takumainoue/.dropbox-takumainoue7
sudo git clone https://github.com/takumainoue/.dropbox-internousdev01
sudo git clone https://github.com/takumainoue/.dropbox-internousdev02
sudo git clone https://github.com/takumainoue/.dropbox-internousdev03
sudo git clone https://github.com/takumainoue/.sh
sudo git clone https://github.com/takumainoue/release-internousdevmaster
sudo git clone https://github.com/takumainoue/release-internousdevwork
sudo git clone https://github.com/takumainoue/.bat
sudo git clone https://github.com/takumainoue/openconnect
sudo git clone https://github.com/takumainoue/.ssh
sudo git clone https://github.com/takumainoue/.sql
sudo git clone https://github.com/takumainoue/.zsh
sudo git clone https://github.com/takumainoue/.war

