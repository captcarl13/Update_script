: <<'comment'
quick install script, use this to install basic tools for fresh install. update regularly as you remember to add more tools to first-time setup
tools in this script:
tmux
neofetch
emacs
github cli
zsh and plugins
ohmyzsh
glances
Docker NOTE: Docker doesn't run effectively on 32-bit Pi's and should be installed manually. For more Docker info see https://docs.docker.com/engine/install/raspbian/
To install Pi-Hole, Unbound, and PiVPN see lines and remove from block as needed. For more information: https://docs.pi-hole.net/main/basic-install/ and https://docs.pi-hole.net/guides/dns/unbound/
comment

sleep 1 && echo START ME UP && sleep 3

sudo apt update
sudo apt install tmux htop neofetch emacs -y

#github cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

#zsh and ohmyzsh
echo Installing zsh and dependencies. Do not change default shell to zsh until script finizhes remaining steps...
sleep 3
sudo apt install zsh -y
sleep 1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#powerlevel10k REQUIRES OHMYZSH
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#glances
curl -L https://bit.ly/glances | /bin/bash

#Docker, see notes above
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

:<<'comment'
#Pi-Hole installation
curl -sSL https://install.pi-hole.net | bash

#Unbound
sudo apt update && sudo apt install unbound
wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints

comment
