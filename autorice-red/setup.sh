#install stuff
echo "Installing prerequisites"
pacman -S vim feh alacritty kitty

#Install yay
echo "Installing yay (AUR Helper)"
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown $USER:`id -gn` ./yay-git
cd yay-git
makepkg -si

#install polybar
echo "Installing polybar"
yay -S polybar


#polybar
echo "Setting up polybar"
sh scripts/polybar-themes/polybar.sh
rm -rf ~/.config/polybar/grayblocks
cp config/grayblocks ~/.config/polybar

#emojis
echo "Installing emojis"
sh scripts/emoji.sh



#alacritty
echo "Installing alcritty config"
mv ~/.config/alacritty/alacritty.yml alacritty.yml.bak
cp config/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir ~/.config/alacritty

#kitty
echo "Installing kitty config"
mv ~/.config/kitty/kitty.conf kitty.conf.bak
cp config/kitty.conf ~/.config/kitty/kitty.conf
mkdir ~/.config/kitty

#i3-config
echo "Installing i3 config"
mv ~/.config/i3/config config.bak
cp config/i3/config ~/.config/i3/config

#wallpapers
cp -r wallpapers ~/Pictures
echo 'exec_always feh --bg-scale ~/Pictures/wallpapers/redarch.png' >> ~/.config/i3/config

