# ❄  NixOS Gruvbox Rice

Gruvbox theme for NixOS with Hyprland.

## 🖼️ Screenshots

![Showcase](./.assets/showcase.png)

![Showcase 2](./.assets/showcase_2.png)


| Software       | Description                                  |
|-----------------|-------------------------------------------|
| [Hyprland](https://github.com/hyprwm/hyprland) 🪟 | Wayland compositor            |
| [Rofi](https://github.com/davatorium/rofi)🚀 | Launcher, clipboard and emoji  |
| [Kitty](https://github.com/kovidgoyal/kitty)🐱 | Terminal                   |
| [Waybar](https://github.com/Alexays/Waybar) | Panel for Wayland        |
| [Dunst](https://github.com/dunst-project/dunst)🔔 | Notification Daemon             |
| [Yazi](https://github.com/sxyazi/yazi)📂 | File Manager|
| [Latest](https://kernel.org/)⚡ | Linux Kernel              |

# 🛠️ Installation
```bash
nix-shell -p git
git clone https://github.com/gemakfy/NixOS-dotfiles --depth=1
cd ./NixOS-dotfiles/hardware
rm hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
reboot
```
# 🔐 Secure boot
```bash
bootctl status # check uefi support
sudo sbctl create-keys # generate keys
sudo sbctl verify # check signed
sudo sbctl enroll-keys --microsoft # enroll keys

# read lanzaboote docs https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md
```

> **⚠️ Warning**
> This configuration is specifically designed for username `gemakfy`.
> If your username is different, the config will not work without modifications.
> replace all occurrences of `gemakfy` with your username.

## 🥀references
config base: https://github.com/Andrey0189/nixos-config
