{
  wayland.windowManager.hyprland.settings = {
    # render = {
    # 	explicit_sync = 0;
    # };
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$menu" = "rofi -show drun";
    "$fileManager" = "nemo";

    bind = [
      # Window/Session actions.
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive,"
      "$mainMod, M, exit"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod SHIFT, R, exec, rofi -modi emoji -show emoji"
      "$mainMod, Tab, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy" 
      "$mainMod SHIFT, B, exec, pkill waybar && waybar"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, A, togglesplit," # dwindle
      "$mainMod, X, exec, librewolf"
      "$mainMod, B, exec, spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"
      "$mainMod, T, exec, vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"# Dwindle
      "$mainMod, D, exec, AyuGram"
      "$mainMod, O, togglesplit,"
      "$mainMod, P, pseudo,"
      "$mainMod, F, fullscreen"
      ", Print, exec, grimblast --freeze copysave area && mv /home/gemakfy/*.png /home/gemakfy/screenshots"

      # Move focus with mainMod + arrow keys
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"


      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
