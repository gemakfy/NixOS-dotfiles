{
  programs.zathura = {
    enable = true;

    options = {
      font = "DejaVu Sans Mono 11";
      selection-clipboard = "clipboard";

      default-bg = "#1d2021";
      default-fg = "#ebdbb2";

      statusbar-bg = "#3c3836";
      statusbar-fg = "#ebdbb2";

      inputbar-bg = "#1d2021";
      inputbar-fg = "#ebdbb2";

      notification-bg = "#1d2021";
      notification-fg = "#ebdbb2";
      notification-error-bg = "#cc241d";
      notification-error-fg = "#ebdbb2";
      notification-warning-bg = "#d79921";
      notification-warning-fg = "#282828";

      highlight-color = "rgba(250, 189, 47, 0.5)";
      highlight-active-color = "rgba(254, 128, 25, 0.5)";

      recolor = "true";

      recolor-lightcolor = "rgba(0,0,0,0)";
      recolor-darkcolor = "#ebdbb2";
    };
  };
}
