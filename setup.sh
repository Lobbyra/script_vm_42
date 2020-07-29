GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

echo "user42\nuser42" | sudo passwd root > /dev/null
clear
printf "${GREEN}root password changed to user42.${NC}\n"

sudo echo "APT::Periodic::Update-Package-Lists \"0\";" > /etc/apt/apt.conf.d/20auto-upgrades
sudo echo "APT::Periodic::Unattended-Upgrade \"1\";" >> /etc/apt/apt.conf.d/20auto-upgrades

printf "${GREEN}Keyboard layout changed to macintosh US${NC}\n"

sudo apt -qq update

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

runuser -l user42 -c 'code --install-extension shan.code-settings-sync &> /dev/null'

printf "${GREEN}VS Code Sync extension installed${NC}\n"

echo "{
    "sync.gist": "a3bcc1e7560714caf1c91c7f073567ab",
    "sync.forceDownload": true,
    "sync.autoDownload": true
}" > $HOME/.config/Code/User/settings.json

printf "${GREEN}Sync setup${NC}\n"

mkdir $HOME/code 2> /dev/null
printf "${GREEN}mkdir $HOME/code${NC}\n"

echo "cd $HOME/code" >> $HOME/.zshrc
printf "${GREEN}setup default dir to $HOME/code${NC}\n"

printf "${GREEN}Workflow setup${NC}\n"

echo "The VM will reboot in 3 seconds..."
sleep 3
