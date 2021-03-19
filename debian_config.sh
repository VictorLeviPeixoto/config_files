#!/bin/bash

sudo apt-get update
sudo apt-get install git \
	vim \
	chrome \
	terminator \
	docker

sudo apt-get install npm
npm -v
npm install node@latest -g
node -v

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cp -f ~/Documents/config_files/.* ~/
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

cp -f -r ~/Documents/config_files/config ~/.config

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

if [-v $1] && [-v $2]
then
	docker login $1 $2
fi

sudo npm i -g yarn n
