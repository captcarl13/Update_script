#!/bin/bash
ECHO Checking for macOS updates...
sleep 1
ECHO Please enter Administrator password:
sudo softwareupdate -ia
sleep 3
ECHO Updating Homebrew...
brew update
sleep 1
ECHO The following formulae are OUTDATED and are being UPGRADED:
brew outdated
sleep 3
brew upgrade
sleep 3
ECHO Checking for and updating App Store Apps...
mas outdated
sleep 5
mas upgrade
sleep 1
ECHO Syncing Google Drive share...
sleep 2
rsync -var --progress ~/Library/Mobile\ Documents/com~apple~CloudDocs/Metroid/ ~/Google\ Drive/Metroid
sleep 3
afplay /System/Library/Sounds/Glass.aiff & ECHO Updates complete!
read -r -p "Would you like to reboot? [y/N] " response
if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
then
  ECHO Please enter Administrator password if prompted: & nohup sudo shutdown -r +1 &>/dev/null &
  ECHO Rebooting...
  exit
else
  ECHO Done!
fi
