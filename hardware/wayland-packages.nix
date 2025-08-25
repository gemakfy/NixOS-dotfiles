{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # Audio
    pipewire
    pamixer # pulseaudio cli mixer
    alsa-utils

    # Rofi
    rofi-wayland # launcher
    rofi-emoji
    cliphist # clipboard
    wl-clipboard

    # Screenshot
    grim
    slurp
    grimblast

    # Wallpapers
    waypaper
    swww
    mpvpaper

    # Hyprland
    hyprland
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
    quickshell
    nemo

    home-manager

    # libs
    bibata-cursors
    gtk4

    # libs for sddm
    sddm-astronaut
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.hack
    dejavu_fonts
  ];
}
