#set -e

ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

brew doctor
brew update
brew upgrade
brew -v

brew install emacs

brew install mysql
#mysql.server restart

mysqladmin -u root password 'mysql'
mysqladmin -u root -h host.local password 'mysql'


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
  sudo chmod -R 777 ./
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
  sudo echo $SHELL
  sudo echo /bin/zsh >> /etc/shells
  sudo chsh
#fi

sudo git clone https://github.com/takumainoue/.zsh

if [ -f "~/.zshrc" ]; then
  rm ~/.zshrc
fi

#if[ -d "~/.zsh" ]; then
  sudo rm -rf ~/.zsh
  ln -s ~/programmercollege/github/homedir/.zsh/.zshrc ~/.zshrc
  source ~/.zshrc
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

cd ~/programmercollege/github/internousdevdoc
sudo git clone https://github.com/internousdevdoc/201407-01-bookmanager07
sudo git clone https://github.com/internousdevdoc/201407-02-shop
sudo git clone https://github.com/internousdevdoc/201409-01-bookmanager09
sudo git clone https://github.com/internousdevdoc/201410-01-bookmanager
sudo git clone https://github.com/internousdevdoc/201410-02-ec10
sudo git clone https://github.com/internousdevdoc/201411-01-attendance11
sudo git clone https://github.com/internousdevdoc/201411-02-ec11
sudo git clone https://github.com/internousdevdoc/201412-01-attendance
sudo git clone https://github.com/internousdevdoc/201412-02-chikezon
sudo git clone https://github.com/internousdevdoc/201501-01-oden
sudo git clone https://github.com/internousdevdoc/201501-01-sakatike
sudo git clone https://github.com/internousdevdoc/201501-02-uesto
sudo git clone https://github.com/internousdevdoc/201502-01-tourtike
sudo git clone https://github.com/internousdevdoc/201502-02-solare
sudo git clone https://github.com/internousdevdoc/201503-01-worldtravel
sudo git clone https://github.com/internousdevdoc/201503-01-youjustjewelry
sudo git clone https://github.com/internousdevdoc/201503-02-gpscoffee
sudo git clone https://github.com/internousdevdoc/201504-01-lapoupee
sudo git clone https://github.com/internousdevdoc/201504-02-ucycle
sudo git clone https://github.com/internousdevdoc/201505-01-baseballticket
sudo git clone https://github.com/internousdevdoc/201505-01-liveticket
sudo git clone https://github.com/internousdevdoc/201505-02-ichigoichie
sudo git clone https://github.com/internousdevdoc/201506-01-movieticket
sudo git clone https://github.com/internousdevdoc/201506-01-gticket
sudo git clone https://github.com/internousdevdoc/201506-02-tbox
sudo git clone https://github.com/internousdevdoc/201507-01-biggalaxy
sudo git clone https://github.com/internousdevdoc/201507-02-khome
sudo git clone https://github.com/internousdevdoc/201508-01-aquarium
sudo git clone https://github.com/internousdevdoc/201508-02-aquarium
sudo git clone https://github.com/internousdevdoc/201509-01-lereve
sudo git clone https://github.com/internousdevdoc/201509-02-shizuku
sudo git clone https://github.com/internousdevdoc/201510-01-ukiukiutopia
sudo git clone https://github.com/internousdevdoc/201510-01-footprinter
sudo git clone https://github.com/internousdevdoc/201510-02-pizzaseijin
sudo git clone https://github.com/internousdevdoc/201511-01-cinemajapan
sudo git clone https://github.com/internousdevdoc/201511-02-chocotime
sudo git clone https://github.com/internousdevdoc/201512-01-rakuraku
sudo git clone https://github.com/internousdevdoc/201512-02-kinnosawa
sudo git clone https://github.com/internousdevdoc/201601-01-mackeypark
sudo git clone https://github.com/internousdevdoc/201601-02-kuruyama
sudo git clone https://github.com/internousdevdoc/201602-01-gekidanroadshow
sudo git clone https://github.com/internousdevdoc/201602-02-ichigoichie-phase2
sudo git clone https://github.com/internousdevdoc/201603-01-uesto-phase2
sudo git clone https://github.com/internousdevdoc/201603-01-solare-phase2
sudo git clone https://github.com/internousdevdoc/201604-01-gtickets-phase2
sudo git clone https://github.com/internousdevdoc/201604-01-chikezon-phase2
sudo git clone https://github.com/internousdevdoc/201604-01-lapoupee-phase2


sudo chown inouetakuma ./*


cd ~/programmercollege/github/internousdevjava

cd ~/programmercollege/github/internousdevmaster
# common
git clone https://github.com/takumainoue/jenkins
git clone https://github.com/internousdevmaster/openconnect
git clone https://github.com/internousdevmaster/Provisioning
git clone https://github.com/internousdevmaster/spring-web-project
git clone https://github.com/internousdevmaster/spring-samplecode
git clone https://github.com/internousdevmaster/releaseproject

# 201407
git clone https://github.com/internousdevmaster/bookmanager07
git clone https://github.com/internousdevmaster/Shop
# 201408
# 201409
git clone https://github.com/internousdevmaster/bookmanager09
# 201410
git clone https://github.com/internousdevmaster/bookmanager
git clone https://github.com/internousdevmaster/ec_10
# 201411
git clone https://github.com/internousdevmaster/EC_11
# 201412
#git clone https://github.com/internousdevmaster/attendance_12
git clone https://github.com/internousdevmaster/attendance
git clone https://github.com/internousdevmaster/chikezon
# 201501
git clone https://github.com/internousdevmaster/Oden
git clone https://github.com/internousdevmaster/sakatike
git clone https://github.com/internousdevmaster/UESTO
# 201502
git clone https://github.com/internousdevmaster/tourtike
git clone https://github.com/internousdevmaster/solare
# 201503
git clone https://github.com/internousdevmaster/WorldTravel
git clone https://github.com/internousdevmaster/YouJustJewelry
git clone https://github.com/internousdevmaster/gpscoffee
# 201504
git clone https://github.com/internousdevmaster/LaPoupee
git clone https://github.com/internousdevmaster/UCycle
# 201505
git clone https://github.com/internousdevmaster/LiveTickets
git clone https://github.com/internousdevmaster/baseballTicket
git clone https://github.com/internousdevmaster/IchigoIchie
# 201506
git clone https://github.com/internousdevmaster/G-Tickets
git clone https://github.com/internousdevmaster/MovieTickets
git clone https://github.com/internousdevmaster/tBox
# 201507
git clone https://github.com/internousdevmaster/biggalaxy
git clone https://github.com/internousdevmaster/k-home
# 201508
# git clone https://github.com/internousdevmaster/aquarium
# 201509
git clone https://github.com/internousdevmaster/lereve
git clone https://github.com/internousdevmaster/shizuku
# 201510
git clone https://github.com/internousdevmaster/footprinter
git clone https://github.com/internousdevmaster/ukiukiutopia
git clone https://github.com/internousdevmaster/pizzaseijin
# 201511
git clone https://github.com/internousdevmaster/cinemajapan
git clone https://github.com/internousdevmaster/chocotime
# 201512
git clone https://github.com/internousdevmaster/rakuraku
git clone https://github.com/internousdevmaster/kinnosawa
# 201601
git clone https://github.com/internousdevmaster/mackeypark


cd ~/programmercollege/github/internousdevwork
# common
git clone https://github.com/internousdevwork/strutsdb
git clone https://github.com/internousdevwork/spring
git clone https://github.com/internousdevwork/openconnect
git clone https://github.com/internousdevwork/openconnect1505
git clone https://github.com/internousdevwork/prototype
git clone https://github.com/internousdevwork/prototype_11
git clone https://github.com/internousdevwork/prototype1509
git clone https://github.com/internousdevwork/prototype1512
git clone https://github.com/internousdevwork/releaseproject
git clone https://github.com/internousdevwork/java
git clone https://github.com/internousdevwork/mypage
git clone https://github.com/internousdevwork/Provisioning
git clone https://github.com/internousdevwork/fcblogin
git clone https://github.com/internousdevwork/rate-exchanger
git clone https://github.com/internousdevwork/creditcard

# 201407
git clone https://github.com/internousdevwork/bookmanager07
git clone https://github.com/internousdevwork/Shop
# 201408
# 201409
git clone https://github.com/internousdevwork/bookmanager09
# 201410
git clone https://github.com/internousdevwork/ec_b_10
# 201411
git clone https://github.com/internousdevwork/EC_11a
git clone https://github.com/internousdevwork/EC_11
# 201412
git clone https://github.com/internousdevwork/attendance_12
git clone https://github.com/internousdevwork/chikezon
# 201501
git clone https://github.com/internousdevwork/sakatike
git clone https://github.com/internousdevwork/Oden
git clone https://github.com/internousdevwork/UESTO
# 201502
git clone https://github.com/internousdevwork/tourticket
git clone https://github.com/internousdevwork/solare
# 201503
git clone https://github.com/internousdevwork/WorldTravel
git clone https://github.com/internousdevwork/gpscoffee
# 201504
git clone https://github.com/internousdevwork/Lapoupee
git clone https://github.com/internousdevwork/Ucycle
# 201505
git clone https://github.com/internousdevwork/LiveTickets
git clone https://github.com/internousdevwork/baseballTicket
git clone https://github.com/internousdevwork/Ichigoichie
# 201506
# 201507
git clone https://github.com/internousdevwork/k-home
# 201508
git clone https://github.com/internousdevwork/aquarium
# 201509
git clone https://github.com/internousdevwork/lereve
git clone https://github.com/internousdevwork/shizuku
# 201510
git clone https://github.com/internousdevwork/footprinter
git clone https://github.com/internousdevwork/ukiukiutopia
# 201511
git clone https://github.com/internousdevwork/cinemajapan
git clone https://github.com/internousdevwork/chocotime
# 201512
git clone https://github.com/internousdevwork/rakuraku
git clone https://github.com/internousdevwork/kinnosawa
# 201601
git clone https://github.com/internousdevwork/mackeypark
git clone https://github.com/internousdevwork/kuruyama
# 201602
git clone https://github.com/internousdevwork/gekidanroadshow
