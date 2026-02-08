let
  colors = {
    background = "#1d2021";
    foreground = "#ebdbb2";
    text_low = "#a89984";
    text_crit = "#fb4934";
    frame_low = "#665c54";
    frame_norm = "#d79921";
    frame_crit = "#cc241d";
    frame_main = "#d65d0e";
  };
in
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = "(0, 300)";
        origin = "top-right";
        offset = "(10, 50)";

        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        highlight = colors.frame_norm;

        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 8;
        frame_width = 2;
        gap_size = 0;
        separator_height = 2;
        separator_color = "frame";
        corner_radius = 8;

        font = "Noto Sans 10";
        format = "<b>%s</b>\\n%b";
        markup = "full";
        alignment = "left";
        vertical_alignment = "center";
        ellipsize = "middle";

        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 80;

        sort = "yes";
        idle_threshold = 120;
        show_age_threshold = 60;
        sticky_history = "yes";
        history_length = 20;

        frame_color = colors.frame_main;
        timeout = 10;

        inherit (colors) background foreground;
      };

      urgency_low = {
        inherit (colors) background;
        foreground = colors.text_low;
        frame_color = colors.frame_low;
        timeout = 4;
      };

      urgency_normal = {
        inherit (colors) background foreground;
        frame_color = colors.frame_norm;
        timeout = 6;
      };

      urgency_critical = {
        inherit (colors) background;
        foreground = colors.text_crit;
        frame_color = colors.frame_crit;
        timeout = 0;
      };

      fullscreen_delay_everything = {
        fullscreen = "delay";
      };
    };
  };
}
