#!/bin/bash

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]
then
	printf "${ORANGE}WARNING : ${NC}Please run this script with sudo. :)\n"
	exit
fi

echo "user42\nuser42" | sudo passwd root > /dev/null
clear
printf "${GREEN}root password changed to user42.${NC}\n"

# This down code is to disable daily update that can lock apt use at start
# and for a long time... Do apt update sometimes.
sudo echo "APT::Periodic::Update-Package-Lists \"0\";" > /etc/apt/apt.conf.d/20auto-upgrades
sudo echo "APT::Periodic::Unattended-Upgrade \"1\";" >> /etc/apt/apt.conf.d/20auto-upgrades

echo "
<?xml version=\"1.0\" encoding=\"UTF-8\"?>

<channel name=\"keyboard-layout\" version=\"1.0\">
  <property name=\"Default\" type=\"empty\">
    <property name=\"XkbDisable\" type=\"bool\" value=\"false\"/>
    <property name=\"XkbModel\" type=\"string\" value=\"macintosh\"/>
    <property name=\"XkbLayout\" type=\"string\" value=\"us\"/>
    <property name=\"XkbVariant\" type=\"string\" value=\"mac\"/>
  </property>
</channel>
" > $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml

printf "${GREEN}Keyboard layout changed to macintosh US${NC}\n"

sudo apt -qq update &
PID=$!
i=1
sp="/-\|"
echo -n 'Research and installation of some updates...'
printf "\n"
while [ -d /proc/$PID ]
do
	printf "\r${sp:i++%${#sp}:1}"
	sleep 0.2
done

printf "${GREEN}Apt update done, you can upgrade but it could be long.${NC}\n"

sudo update-locale LANG=en_US.UTF-8 LANGUAGE &> /dev/null

printf "${GREEN}OS language changed to ENG/US${NC}\n"

echo "set number
syntax on
set mouse=a
set colorcolumn=80
set tabstop=4
set autoindent" > $HOME/.vimrc

printf "${GREEN}Vim config installed${NC}\n"

runuser -l user42 -c 'code --install-extension kube.42header &> /dev/null'

printf "${GREEN}VS Code 42 Header extension installed${NC}\n"

mkdir $HOME/code 2> /dev/null
chown user42 $HOME/code
printf "${GREEN}mkdir $HOME/code${NC}\n"

echo "cd $HOME/code" >> $HOME/.zshrc
printf "${GREEN}setup default dir to $HOME/code${NC}\n"

printf "${GREEN}Workflow setup${NC}\n"

echo "The VM will reboot in 3 seconds..."
sleep 3
