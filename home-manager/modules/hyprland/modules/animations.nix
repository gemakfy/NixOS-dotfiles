{
  wayland.windowManager.hyprland.settings.animations = {
    enabled = true;
    bezier = [
      "smoothOut, 0.25, 1, 0.5, 1"
      "easeOutExpo, 0.16, 1, 0.3, 1"
    ];
    animation = [
      "windows, 1, 4, easeOutExpo, popin 80%"
      "windowsIn, 1, 4, easeOutExpo, popin 80%"
      "windowsOut, 1, 3, smoothOut, popin 80%"
      "workspaces, 1, 5, smoothOut, slide"
      "specialWorkspace, 1, 5, smoothOut, slidevert"
      "fade, 1, 4, smoothOut"
    ];
  };
}
