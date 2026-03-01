{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Audio
    pipewire
    alsa-utils

    # Rofi
    rofi # launcher
    rofi-emoji
    cliphist # clipboard
    wl-clipboard

    # Wallpapers
    waypaper
    swww

    # Hyprland
    hyprland
    hyprshot
    hyprcursor
    hyprpolkitagent
    xwayland
    egl-wayland
    xdg-desktop-portal-hyprland

    # Other
    dunst
    wireplumber
    kitty
    waybar
    nemo

    home-manager

    # libs
    bibata-cursors
    gtk4
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.hack
    dejavu_fonts
  ];
}
