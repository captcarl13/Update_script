#!/bin/bash
ECHO Checking for macOS system, security, and core App updates...
sleep 1
#sudo is required for softwareupdate
tput bel & afplay /System/Library/Sounds/Glass.aiff & ECHO Please enter Administrator password:
#softwareupdate is Apple's CLI update utility
sudo softwareupdate --verbose --all -ia
sleep 1
#Homebrew is a third-party package manager
#If brew is not installed uncomment the next line or copy/paste it into a new term
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ECHO Updating Homebrew...
brew update &&
sleep 1
ECHO The following formulae are OUTDATED and will be UPGRADED:
brew outdated && brew upgrade
sleep 1
#PowerShell for macOS updater here
ECHO Updating PowerShell for macOS...Enter Administrator password if prompted...
sleep 1
brew cask upgrade powershell
sleep 1
ECHO Checking and updating App Store Apps...
#mas-cli is a Homebrew package which updates third-party App Store apps
#if mas-cli is not installed, uncomment the next line
#brew install mas
mas outdated &&
sleep 3
mas upgrade
sleep 1
#Software update phase ends here
#Atom IDE upgrade phase begins here
ECHO Updating Atom...
apm upgrade --no-confirm
#Question about Syncing Google Drive with iCloud Drive
#This section can be commented out or removed if moving away from a Mac at work
tput bel & afplay /System/Library/Sounds/Glass.aiff & read -r -p "Are you at work? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
    then
      sleep 1
    else
      ECHO Syncing Google Drive share...
      sleep 1
      #rsync begins here
      rsync -varh --progress --delete --exclude .DS_Store --exclude /Apple\ TV\ Photo\ Cache/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/Metroid/ ~/Google\ Drive/Metroid
      #rsync ends here
      sleep 1
  fi
#GDrive and iCloud Drive sync ends here
#Comment out or remove previous section if moving away from a Mac at work
afplay /System/Library/Sounds/Glass.aiff & ECHO Updates complete!
#Reboot prompt begins here
tput bel & read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
    then
      ECHO Please enter Administrator password if prompted:
      wait 1
      sudo shutdown -r +1 & ECHO Rebooting...
      exit 0
    else
      ECHO Done!
  fi
#Reboot prompt ends here
#end of script
