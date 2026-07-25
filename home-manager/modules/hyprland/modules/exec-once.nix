{
  wayland.windowManager.hyprland.settings.exec-once = [
    "waypaper --restore"
    "waybar"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "[workspace 4 silent] librewolf"
    "[workspace special:magic silent] firejail --caps.drop=all --nonewprivs --private-dev --private-tmp --ipc-namespace --noexec=/tmp --disable-mnt --dbus-user=filter --protocol=unix,inet,inet6 --profile=spotify spotify"
    "[workspace special:magic silent] v2rayN"
  ];
}
