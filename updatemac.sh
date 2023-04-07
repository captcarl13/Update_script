#!/bin/bash
# Upgrade ohmyzsh -- comment out below line if zsh isn't your default shell and aren't using ohmyzsh
$ZSH/tools/upgrade.sh
sleep 1
# if brew isn't installed visit brew.sh or paste the following line into a new shell:
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo Updating and upgrading Homebrew packages...Enter Administrator password if prompted...
brew upgrade && brew upgrade --cask && sleep 1
echo Checking for macOS system, security, and core App updates...
sleep 1
# sudo is required for softwareupdate
tput bel & afplay /System/Library/Sounds/Glass.aiff & echo Please enter Administrator password if prompted:
sudo softwareupdate --verbose -ia
# software update phase ends here
afplay /System/Library/Sounds/Glass.aiff & ECHO Updates complete!
sleep 1
# Reboot prompt begins here
tput bel & read -r -p "Would you like to reboot? [y/N] " response
  if [[ "$response" =~ ^([yY][eE]|[yY])+$ ]]
    then
      echo Please enter Administrator password if prompted:
      #wait 1
      sudo shutdown -r +1 & echo Rebooting...
      exit 0
    else
      echo Done!
  fi
# Reboot prompt ends here