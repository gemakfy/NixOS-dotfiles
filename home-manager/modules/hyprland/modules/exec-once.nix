{
  wayland.windowManager.hyprland.settings.exec-once = [
    # "mpvpaper DP-1 -o 'hwdec=nvdec --loop --profile=low-latency --scale=bilinear' --auto-pause ~/nix/home-manager/wallpapers/violet-evergarden-crying-moewalls-com.mp4"
    "waypaper --restore"
    "waybar"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    #"cliphist wipe"
    "[workspace 3 silent] vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"
    "[workspace 4 silent] librewolf"
    "[workspace 5 silent] spotify"
  ];
}
