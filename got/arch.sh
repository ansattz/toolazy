#!/bin/bash
sudo pacman -S plasma mpv wget xorg-xinit xorg-server nvidia xf86-video-amdgpu
echo -e "export DESKTOP_SESSION=plasma\nexec startplasma-x11" >> $HOME/.xinitrc

yes | sudo pacman -S atril unzip deepin-screenshot deepin-image-viewer obs-studio openssh tree neovim github-cli jdk17-openjdk java17-openjfx jre17-openjdk openjdk17-doc mariadb dbeaver python-pip xsel alacritty tmux npm fish lazygit ghc stack haskell-language-server docker docker-compose git-lfs
sudo archlinux-java set java-17-openjdk

## npm install
sudo npm i -g neovim pyright @angular/cli sass vue node-fetch

# pip install
pip install pynvim pandas scikit-learn pydantic fastapi seaborn mariadb vectorbt pyinstaller

# creating custom folders here
mkdir $HOME/.clones
mkdir -p $HOME/.config/tmux/plug
mkdir -p $HOME/.config/nvim/settings
mkdir $HOME/.config/nvim/plugs
mkdir $HOME/.config/nvim/keys
sudo mkdir /usr/local/share/lombok

sudo wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

cd $HOME/.clones
repos=("junegunn/fzf"
   "tmux-plugins/tpm"
   "tmux-plugins/tmux-sensible"
   "egel/tmux-gruvbox"
   )
for str in ${repos[@]}; do
   git clone https://github.com/$str
done
cd $HOME/git/toolazy/got

# fzf
if [ -f "/usr/bin/fish" ]; then
   yes | sh $HOME/.clones/fzf/install
else
   yes | sudo pacman -S fish
   yes | sh $HOME/.clones/fzf/install
fi

cd $HOME/.config/nvim/plugs
git clone https://github.com/junegunn/vim-plug
cd $HOME/git/toolazy/got

cp alacritty-conf.yml $HOME/.alacritty.yml
cp tmux/tmux.conf $HOME/.tmux.conf
cp nvim/plugins.vim $HOME/.config/nvim/plugs/
cp nvim/settings.vim $HOME/.config/nvim/settings/
cp nvim/mappings.vim $HOME/.config/nvim/keys/
cp nvim/coc.vim $HOME/.config/nvim/plugs/
cp nvim/init.vim $HOME/.config/nvim/
cp nvim/coc-settings.json $HOME/.config/nvim/
cp fish/config.fish $HOME/.config/fish/
cp fish/functions/* $HOME/.config/fish/functions/
cp kde/* $HOME/.config/

echo -e "\n[Wallpapers]
usersWallpapers=$HOME/git/toolazy/got/wp.jpg" >> $HOME/.config/plasmarc

cd $HOME/.clones
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome/
yes | makepkg -si
sudo systemctl reboot
