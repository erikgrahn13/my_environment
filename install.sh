#!/bin/bash

# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# touch ~/.bashrc
# echo "source /etc/skel/.bashrc" >> ~/.bashrc
uid_gid_entrypoint

cp /etc/skel/.bashrc ~/

printf '2\nn\n' | sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

echo "export PATH="/home/builder/.local/bin:\$PATH"" >> ~/.bashrc
source ~/.bashrc

printf 'Y\n' | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "exec zsh" >> ~/.bashrc
# exh
# exec zsh
# sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"


