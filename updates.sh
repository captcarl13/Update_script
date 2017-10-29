#!/bin/bash
ECHO Checking macOS updates...
sleep 1
ECHO Please enter Administrator password:
# softwareupdate is Apple's first-party system updater
sudo softwareupdate -ia --verbose
sleep 3
# Homebrew is a third-party package manager
ECHO Updating Homebrew...
brew update
sleep 1
ECHO The following formulae are OUTDATED and are being UPGRADED:
brew outdated
sleep 3
brew upgrade
sleep 3
ECHO Checking and updating App Store Apps...
# mas is a Homebrew package which updates third-party App Store apps
mas outdated
sleep 5
mas upgrade
sleep 1
# Software update phase ends here
# Question about Syncing Google Drive with iCloud Drive
afplay /System/Library/Sounds/Glass.aiff
read -r -p "Are you at work? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
    then
      sleep 1
    else
      ECHO Syncing Google Drive share...
      sleep 2
      rsync -var --progress --exclude .DS_Store --exclude /Apple\ TV\ Photo\ Cache/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/Metroid/ ~/Google\ Drive/Metroid
      sleep 3
  fi
# GDrive and iCloud Drive sync ends here
# Reboot prompt below
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
# Reboot prompt ends here
# end of script
