### Day 1
- Install __wireplumber__ [Sound related]

### Day 2
- Install __yay__
- Install __visual-studio-code-bin__. (`yay -S visual-studio-code-bin`)
- Install __oh-my-bash__

### Day 3
- Make taglist show _CYBERPUNK_. (Follow this tutorial: https://pavelmakhov.com/awesome-wm-widgets/). Relevant Cyberpunk font is in fonts directory.
- Install __spotify_launcher__
- Install __spicetify__

### Day 4
- Install __redshift__ [Blue light filter]
- Enable multimedia controls (Volume +/-, Toggle mute, Play/Pause music) using keyboard
- Make wibar transparent with tasklist at center

### Day 5
- Changed alacritty font family (CodeNewRomanNerdFont)
- Install __htop__
- Install __cowsay__
- Install __cava__ [A terminal sound output visualizer] (`yay -S cava`)
- Fixed unresponsive touchpad on boot (run __fix_touchpad__)
- Check battery level from terminal (run __check_battery__)
- Added a bash greeting
- Added wallpaper switcher (half-finished), access with Mod+c

### Day 6
- Install __anydesk__ (`yay -S anydesk-bin`)<br>
    Add "type=x11" to /etc/pam.d/system-login:<br>
    `session optional pam_systemd.so type=x11`<br>
    (In case connecting from other device shows *display server not supported*)

todo
----
- Complete working on wallpaper switcher
- Brightness control with keyboard
