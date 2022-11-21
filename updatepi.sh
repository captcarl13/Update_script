#!/bin/bash
# comment out line 3 if zsh isn't your default shell
env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
# comment out line 9 if you aren't running Pi-Hole+Unbound
wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints
sleep 1
echo
echo
# Reboot prompt begins here
read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
	then
	  echo Please enter Administrator password if prompted:
	  	  sudo shutdown -r +1 & echo Rebooting...
	  exit 0
	else
	  echo Done!
  fi
# Reboot prompt ends here