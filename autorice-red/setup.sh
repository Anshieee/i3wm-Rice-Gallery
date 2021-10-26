
spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b""${sp:i++%n:1}"
    done
}
####


#install prerequisites
echo "[*] Installing prerequisites"
sudo pacman -S vim feh alacritty kitty base-devel git --noconfirm --needed



#Install yay
check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
if [ -n "${check}" ] ; then
    echo "yay is already installed";
elif [ -z "${check}" ] ; then
    echo "[*] Installing AUR Helper 'yay'"
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown $USER:`id -gn` ./yay-git
    cd yay-git
    makepkg -si
    echo "yay installed"
fi;



#install polybar
echo "[*] Installing polybar"
yay -S polybar


#polybar
echo "[*] Setting polybar up"
#if [ -d "$DIR" ]; then
#    echo "'$DIR' Already exists, please wait ..."
#    echo "making backup"
#    mv /home/$USER/.config/polybar /home/$USER/.config/polybar.bak
#else
#    echo "Making dir and copying configurations ..."
    sh scripts/polybar-themes/polybar.sh
    rm -rf ~/.config/polybar/grayblocks
    cp config/grayblocks ~/.config/polybar




#emojis
echo "[* ]Setting up Noto Emoji font..."
sudo pacman -S noto-fonts-emoji --needed
#add font config
sudo echo "<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
    <family>DejaVu Sans Mono</family>
   </prefer>
 </alias>
</fontconfig>

" > /etc/fonts/local.conf
# 3 - update font cache via fc-cache
fc-cache
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
echo "consider inconsolata regular"


#alacritty
#mv ~/.config/alacritty/alacritty.yml alacritty.yml.bak
#cp config/alacritty.yml ~/.config/alacritty/alacritty.yml

DIR="/home/$USER/.config/alacritty"
if [ -d "$DIR" ]; then
   echo "'$DIR' Already exists, please wait ..."
   echo "making backup"
   mv /home/$USER/.config/alacritty /home/$USER/.config/alacritty-bak
else
   echo "Making dir and copying configurations ..."
   cp -r config/alacritty /home/$USER/.config/
fi


#kitty
#mv ~/.config/kitty/kitty.conf kitty.conf.bak
#cp config/kitty.conf ~/.config/kitty/kitty.conf

DIR="/home/$USER/.config/kitty"
if [ -d "$DIR" ]; then
   echo "'$DIR' Already exists, please wait ..."
   echo "making backup"
   mv /home/$USER/.config/kitty /home/$USER/.config/kitty-bak
else
   echo "Making dir and copying configurations ..."
   cp -r config/kitty /home/$USER/.config/
fi


#i3-config
echo "[*] Installing i3 config"
mv ~/.config/i3/config config.bak
cp config/i3/config ~/.config/i3/config

#wallpapers
cp -r wallpapers ~/Pictures
echo 'exec_always feh --bg-scale ~/Pictures/wallpapers/redarch.png' >> ~/.config/i3/config
