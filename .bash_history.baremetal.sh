sudo pacman -Syu

nmtui

sudo pacman -Syu

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xev awesome firefox picom
sudo pacman -S noto-fonts-emoji noto-fonts-extra xdg-desktop-portal speech-dispatcher
pipewire
sudo pacman -S libnotify

startx

nvim ~/.xinitrc
startx
ls
ls -l
ls -la
cd .config
ls
ls -la

nvim /etc/pacman.conf
sudo nvim /etc/pacman.conf
lspci
lspci -v | grep -A1 -e VGA -e 3D
pacman -Ss xf86-video
sudo pacman -Sy xf86-video-amdgpu

cd ~
ls -la
libinput list-devices
sudo libinput list-devices
xinput -list
pacman -S needed
sudo pacman -S needed
sudo pacman -S needed base-devel

xinput -list
xinput list-props 12
xinput set-prop 12 328 1
xinput list-props 12
xinput set-prop 12 329 1

xinput list-props 12 | grep 'Natural'
xinput set-prop 12 299 1
ping -c 3
ping -c 3 google.com
ping google.com

#1720175017
sudo pacman -S yay-git
#1720175093
pacman -S --needed git base-devel
#1720175093
git clone https://aur.archlinux.org/yay.git
#1720175095
cd yay
#1720175095
makepkg -si
#1720175097

#1720175104
sudo pacman -S --needed git base-devel
#1720175114
cd ..
#1720175119
git clone https://aur.archlinux.org/yay.git
#1720175124
rm -rf yay
#1720175127
git clone https://aur.archlinux.org/yay.git
#1720175147
git config --global init.defaultBranch main
#1720175163
cd yay/
#1720175166
makepkg -si
#1720175342
ls
#1720175345

#1720175348
cd ..
#1720175351
rm -rf yay
#1720175359
yay -Y --gendb
#1720175444
source ~/.bashrc
xrandr -q
xrandr --output "Screen 0" --brightness 1
xrandr --output "Screen0" --brightness 1
xrandr --output edp  --brightness 2
xrandr --output eDP --brightness 2
xrandr --output eDP --brightness 1
xrandr --output eDP --brightness 0.3
xrandr --output eDP --brightness 0.4
killall picom

sudo cp /etc/xdg/awesome/ ~/.config/awesome
sudo cp -r /etc/xdg/awesome/ ~/.config/awesome/
l
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
#1720175523
sudo nvim /etc/makepkg.conf
#1720175553
yay -S visual-studio-code-bin
#1720175750
code ~/.config/awesome/
#1720176040
ls -la
#1720176072
cd ..
#1720176095
cd ~/.config
#1720176104
rm -rf awesome
#1720176108
sudo rm -rf awesome
#1720176130
mkdir awesome
#1720176133
cd awesome/
#1720176135
code .
#1720176348
cd ~
#1720176444
sudo pacman -Sy xdg-user-dirs
#1720176537
xdg-user-dirs-update
#1720176559
mkdir -p ./Pictures/Wallpapers
#1720176698
top
#1720176767
picom &
#1720176816
mkdir -p ~/.config/alacritty
#1720176828
cd ~/.config/alacritty/
#1720176837
nvim alacritty.toml
#1720177523
sudo pacman -S nautilus
#1720177672
xinput list-props 12
#1720177713
xinput set-prop 12 328 1
#1720177728
xinput set-prop 12 299 1
#1720177942
picom &
startx
#1720199253
kilall picom
#1720199260
killall picom
#1720199275
cat ~/.bash_history 
#1720199338
picom &
#1720199410
xinput list-props 12
#1720199415
xinput list-props
#1720199418
xinput list
#1720199444
xinput list-props 4
#1720199575
sudo pacman -Sy xorg-xinput
#1720199598
xinput -l
#1720199622
xinput list --long
#1720199659
xinput list
#1720200086
lear
#1720200098
xinput list
#1720200495
cat ~/.bash_history
#1720200470
journalctl -xe
#1720200527
libinput
#1720200529
cler
#1720200537
libinput list-devices
#1720200541
sudo libinput list-devices
#1720200586
xrandr --output eDP --brightness 0.4
#1720200629
sudo libinput list-devices
#1720200672
ls /var/log
#1720200688
ls journal
#1720200697
l
#1720200705
ls /var/log -l
#1720200717
ls /var/log/journal/
#1720200723
ls /var/log/journal/d1921973279543da959e13b8838927c6/
#1720200738
ls /var/log/private/
#1720200743
sudo ls /var/log/private/
#1720200750
sudo ls /var/log/audit
#1720200797
cat .local/share/xorg/Xorg.0.log
#1720200971
reboot
#1720201044
sudo libinput list-devices
#1720201092
xinput -list
#1720201124
xrandr --output eDP --brightness 0.5
#1720201186
xinput list-props 12
#1720201209
xinput set-prop 12 328 1
#1720201222
xinput set-prop 12 299 1
#1720201377
cat .xinitrc 
#1720201408
cp /etc/X11/xinit/xinitrc ~/.xinitrc
#1720201412
cat .xinitrc 
#1720201415
cp /etc/X11/xinit/xinitrc ~/.xinitrc
#1720201430
nvim ~/.xinitrc 
#1720201564
nvim ~/.config/alacritty/alacritty.toml 
#1720201804
sudo pacman -S pipewire
#1720201864
sudo pacman -S wireplumber
#1720201887
xrandr --output eDP --brightness 0.4
#1720201934
nmtui
#1720202119
sudo pacman -S flatpak
#1720202250
nvim ~/.config/alacritty/alacritty.toml 
#1720202991
reboot
#1720201010
startx
#1720242243
xrandr --output eDP --brightness 0.4
#1720242254
xinput set-prop 12 328 1
#1720242271
xinput list
#1720242278
xinput set-prop 10 328 1
#1720242300
xinput list-prop 10
#1720242310
xinput list-props 10
#1720242327
xinput set-prop 10 326 1
#1720242340
xinput set-prop 10 299 1
#1720242572
nvim /boot/loader/loader.conf
#1720242920
efibootmgr -v
#1720242992
bootctl status
#1720243220
nvim /boot/loader/loader.conf
#1720243248
sudo nvim /boot/loader/loader.conf
#1720243380
ls /boot/loader/entries
#1720243577
ls /boot
#1720243612
sudo pacman -Sy edk-shell2
#1720243633
sudo pacman -Sy edk2-shell
#1720243720
blkid
#1720243969
sudo cp /usr/share/edk2-shell/x64/Shell.efi /boot/shellx64.efi
#1720244425
upower
#1720244448
cat /sys/class/power_supply/BAT0/capacity
#1720244535
nvim .bash_aliases
#1720244609
check_battery
#1720244619
source ~/.bashrc
#1720244621
check_battery
#1720244629
sudo check_battery
#1720244667
alias
#1720244707
nvim .bash_aliases
#1720244717
source ~/.bashrc
#1720244720
check_battery
#1720244726
check_battery 
#1720244964
reboot
#1720245135
check_battery
#1720245183
blkid
#1720245355
reboot
#1720245513
happy
#1720245558
sudo nvim /boot/loader/entries/windows.conf
#1720245711
ls /boot/loader/entries
#1720245744
cat 2024-07-05_08-25-19_linux.conf
#1720245756
cat /boot/loader/entries/2024-07-05_08-25-19_linux.conf
#1720245774
reboot
#1720245838
sudo nvim /boot/loader/entries/windows.conf
#1720245853
reboot
#1720248190
xinput list
#1720248211
xinput list-props 10
#1720248234
xinput set-prop 10 326 1
#1720248246
xinput set-prop 10 299 1
#1720248258
xrandr --output eDP --brightness 0.4
#1720248887
check_battery
#1720248898
sudo pacman -S spotify-launcher
#1720250313
code ~/.config/awesome/
#1720250664
sudo pacman -S redshift
#1720251278
redshift -P -O 3200
#1720251284
redshift -P -O 1000
#1720251290
redshift -P -O 20000
#1720251297
redshift -P -O 5000
#1720251307
redshift -P -O 6000
#1720251310
redshift -P -O 5500
#1720251322
redshift -P -O 5000
#1720251330
redshift -P -O 5300
#1720251342
xrandr --output eDP --brightness 0.4
#1720251560
nvim ~/.bashrc
#1720251714
source ~/.bashrc
#1720251805
mktouch ~/.config/redshift/redshift.conf
#1720251850
nvim ~/.config/redshift/redshift.conf
#1720251985
redshift
#1720252020
redshift -P
#1720252109
redshift -P -O 5300
#1720252168
ls /sys/class/backlight/
#1720252179
ls /sys/class/backlight/amdgpu_bl2/
#1720252505
ls /etc/X11/xorg.conf.d/
#1720252566
cat /usr/share/X11/xorg.conf.d/40-libinput.conf
#1720252656
sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf
#1720252900
xinput list-props 10
