#Potential variables: timezone, lang and local

passwd

TZuser=$(cat tzfinal.tmp)

ln -sf /usr/share/zoneinfo/$TZuser /etc/localtime

hwclock --systohc

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen

pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager
systemctl start NetworkManager

pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg

pacman --noconfirm --needed -S dialog
larbs() { curl -O https://raw.githubusercontent.com/prakash2033/PARBS/master/parbs.sh && bash parbs.sh ;}
dialog --title "Install Prakash's ArchRice" --yesno "This install script will easily let you access Prakash's Auto-Rice Boostrapping Scripts (PARBS) which automatically install a full Arch Linux Dwm desktop environment.\n\nIf you'd like to install this, select yes, otherwise select no.\n\nPrakash"  15 60 && parbs
