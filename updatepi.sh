#!/bin/bash
env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints
sleep 1
#Reboot prompt begins here
echo -e \n
echo -e \n
read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
	then
	  echo Please enter Administrator password if prompted:
	  	  sudo shutdown -r +1 & ECHO Rebooting...
	  exit 0
	else
	  echo Done!
  fi
#Reboot prompt ends here