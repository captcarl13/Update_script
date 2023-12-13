#!/bin/bash
#Upgrade ohmyzsh -- comment out below line if zsh isn't your default shell and aren't using ohmyzsh
$ZSH/tools/upgrade.sh
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
~/padd.sh -u
#uncomment the line below if you aren't running Pi-Hole+Unbound
#wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints
sleep 1
echo
echo
#comment out 15-22 if you are not using cloudflared
#echo Updating cloudflared...
#sleep 1
#wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64
#sudo systemctl stop cloudflared
#sudo mv -f ./cloudflared-linux-arm64 /usr/local/bin/cloudflared
#sudo chmod +x /usr/local/bin/cloudflared
#sudo systemctl start cloudflared
#cloudflared -v
sleep 2
#Reboot prompt begins here
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