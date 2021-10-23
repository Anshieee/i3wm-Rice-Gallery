#install stuff
pacman -S vim feh alacritty kitty --no-confirm

#Install yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown $USER:`id -gn` ./yay-git
cd yay-git
makepkg -si

#install polybar
yay -S polybar


#polybar
sh scripts/polybar-themes/polybar.sh
rm -rf ~/.config/polybar/grayblocks
cp config/grayblocks ~/.config/polybar

#emojis
sh scripts/emoji.sh



#alacritty
mv ~/.config/alacritty/alacritty.yml alacritty.yml.bak
cp config/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir ~/.config/alacritty

#kitty
mv ~/.config/kitty/kitty.conf kitty.conf.bak
cp config/kitty.conf ~/.config/kitty/kitty.conf
mkdir ~/.config/kitty

#i3-config
mv ~/.config/i3/config config.bak
cp config/i3/config ~/.config/i3/config

#wallpapers
cp -r wallpapers ~/Pictures
echo 'exec_always feh --bg-scale ~/Pictures/wallpapers/redarch.png' >> ~/.config/i3/config
