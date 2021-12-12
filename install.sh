#/bin/bash

RETDIR=$PWD
cd ~/.config

# Refresh Apt
sudo apt update -y

# Git
sudo apt install git
git --global user.email "superkerem13@gmail.com"
git --global user.name  "kaiserthe13th"

# Install fish awesome nvim

sudo apt install fish
sudo apt install awesome
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install neovim

# Clone Configs
git clone kaiserthe13th/awesome-config
git clone kaiserthe13th/neovim-config
git clone kaiserthe13th/fish-config

# Put Configs in Place

mv awesome-config awesome
mv neovim-config nvim
mv fish-config fish

cd ~

# lolcat

sudo apt install lolcat

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh --profile complete

# Node

wget "https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz"
tar -xvf node-v16.13.1-linux-x64.tar.xz -C $HOME

echo 'if [ -d "$HOME/node-v16.13.1-linux-x64/bin" ] ; then' >> ~/.profile
echo '    PATH="$HOME/node-v16.13.1-linux-x64/bin:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile

# PyPy

wget "https://downloads.python.org/pypy/pypy3.8-v7.3.7-linux64.tar.bz2"
tar -xvf pypy3.8-v7.3.7-linux64.tar.bz2

echo 'if [ -d "$HOME/pypy3.8-v7.3.7-linux64/bin/" ] ; then' >> ~/.profile
echo '    PATH="$HOME/pypy3.8-v7.3.7-linux64/bin/:$PATH"' >> ~/.profile
echo 'fi' >> ~/.profile

# Starship Prompt
bash -c "$(curl -fsSL https://starship.rs/install.sh)"

# Python 3.10

cd ~
mkdir compilations
cd compilations

wget "https://www.python.org/ftp/python/3.10.1/Python-3.10.1.tgz"

sudo apt install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev

tar -xvf Python-3.10.1.tgz
cd Python-3.10.1.tgz

./configure --prefix="/usr" --enable-optimizations --with-ensurepip=install
make -j $(nproc)
sudo make install

# Install compton and nitrogen
sudo apt install compton nitrogen
nitrogen

cd $RETDIR
