#!/bin/bash
# Don't run this, never tested yet

PM="sudo pacman --noconfirm -S"
AUR="paru --noconfirm -S"

$PM --needed base-devel
$PM git

# check if paru AUR helper is installed:
if [[ ! -x "$( command -v paru )" ]];then
    git clone https://aur.archlinux.org/paru.git && cd paru && makepkg
    cd ..
fi

if [[ ! -f "${HOME}/.xinitrc" ]];then
	echo "exec i3" > "${HOME}/.xinitrc"
fi

echo """
#!/bin/bash
export EDITOR="nvim"
export BROWSER="firefox"
echo
pfetch
""" > ${HOME}/.greeting.sh

$PM python python-pip
$PM i3
$PM alacritty
$PM nitrogen
$PM firefox
$PM picom
$PM dmenu
$PM polybar
$PM tmux
$PM ntfs3
$PM ranger
$PM discord
$PM xdg-utils
$PM tar zip unzip
$PM jre-openjdk 
$PM nodejs npm
$PM libreoffice-fresh

$PM fish
chsh -s $( which fish )

$PM xorg xorg-xinit

$AUR nerd-fonts-jetbrains-mono
$AUR i3-layouts
$AUR betterlockscreen
$AUR ly
$AUR pfetch
sudo systemctl enable ly.service
echo "Config file for ly : /etc/ly/config.ini"

# ROFI THEMES INSTALLATION
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..
rm -rf rofi

fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
pip install tldr

###### VIM

$PM neovim
$AUR neovim-plug
mkdir ${HOME}/.config/nvim
mv dotfiles/nvim/init.vim ${HOME}/.config/nvim/init.vim
nvim -c ':PlugInstall'
nvim -c ':CocInstall coc-sh' \
    -c ':CocInstall coc-python' \
    -c ':CocInstall coc-clangd'
