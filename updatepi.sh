#!/bin/bash
env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints
#Reboot prompt begins here
tput bel & read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
	then
	  ECHO Please enter Administrator password if prompted:
	  #wait 1
	  sudo shutdown -r +1 & ECHO Rebooting...
	  exit 0
	else
	  ECHO Done!
  fi
#Reboot prompt ends here