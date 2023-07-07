#!/bin/bash

if command -v uid_gid_entrypoint >/dev/null; then
    echo "no uid_gid_entrypoint"
    uid_gid_entrypoint
    cp /etc/skel/.bashrc ~/
fi

# install zsh
if ! command -v zsh >/dev/null; then
    printf '2\nn\n' | sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"
fi

# check if oh-my-zsh already exists
if [ ! -d "$HOME/.oh-my-zsh" ] 
then
    printf 'Y\n' | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# check if powerlevel10k exists
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] 
then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# check if zsh-autosuggestions exists
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] 
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

export PATH="/home/builder/.local/bin:$PATH"
echo "export PATH="/home/builder/.local/bin:\$PATH"" >> ~/.bashrc

cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

echo "exec zsh" >> ~/.bashrc