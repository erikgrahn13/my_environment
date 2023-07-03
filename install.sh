#!/bin/bash

# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# touch ~/.bashrc
# echo "source /etc/skel/.bashrc" >> ~/.bashrc
uid_gid_entrypoint

cp /etc/skel/.bashrc ~/

printf '2\nn\n' | sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

export PATH="/home/builder/.local/bin:$PATH"
echo "export PATH="/home/builder/.local/bin:\$PATH"" >> ~/.bashrc

printf 'Y\n' | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '19i ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc

echo "exec zsh" >> ~/.bashrc
# exh
# exec zsh
# sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"


