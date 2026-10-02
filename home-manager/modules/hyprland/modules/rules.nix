{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:workspace w[tv1], match:float false, border_size 0"
      "match:workspace f[1], match:float false, border_size 0"

      "match:class spotify, workspace special:magic silent"
      "match:class v2rayN, workspace special:magic silent"

      "match:class .*, suppress_event maximize"
    ];

    layerrule = [
      "match:namespace rofi, animation popin 80%"
      "match:namespace rofi, blur true"
      "match:namespace rofi, ignore_alpha 0.5"

      # Disable animations for screenshot and selection tools
      "match:namespace (selection|hyprpicker|slurp), animation none"
    ];
  };
}
