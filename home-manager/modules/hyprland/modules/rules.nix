{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:workspace w[tv1], match:float false, border_size 0"
      "match:workspace f[1], match:float false, border_size 0"

      "match:class spotify, workspace special:magic silent"
      "match:class v2rayN, workspace special:magic silent"
    ];
  };
}
