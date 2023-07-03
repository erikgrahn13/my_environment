#!/bin/bash

# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

printf '2\nn\n' | sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

export PATH="/home/builder/.local/bin:$PATH"

printf 'Y\n' | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

exec zsh
# sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"


