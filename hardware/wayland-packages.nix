{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # Audio
    pipewire
    pulseaudio
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
    nautilus

    home-manager

    # libs
    bibata-cursors
    gtk4
    zulu23 # java

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
  ];
}
