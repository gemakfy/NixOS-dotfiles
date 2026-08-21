{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Audio
    pipewire
    alsa-utils
    mpv

    # Rofi
    rofi # launcher
    rofi-emoji
    cliphist # clipboard
    wl-clipboard

    # Wallpapers
    waypaper
    awww

    # Hyprland
    hyprland
    hyprshot
    hyprcursor
    hyprpolkitagent
    xwayland
    egl-wayland

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
    glfw
  ];

  fonts.packages = with pkgs; [
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
