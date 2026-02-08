{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      display = {
        color = "hidden_"; # "magenta";
        separator = "    ";
      };
      logo.source = ./lain.png;
      modules = [
        {
          type = "custom";
          format = " System";
        }
        {
          type = "title";
          key = " ";
        }
        {
          type = "os";
          key = " 󱄅";
          format = "{3}";
        }
        {
          type = "kernel";
          key = " ";
        }
        {
          type = "packages";
          key = " 󰏗";
        }
        {
          type = "custom";
          format = " ────────────────────────────────";
        }
        {
          type = "custom";
          format = " Hardware";
        }
        {
          type = "cpu";
          key = " ";
          format = "{}";
        }
        {
          type = "gpu";
          key = " ";
          format = "{1}, {3}";
        }
        {
          type = "memory";
          key = " ";
          format = "{1} / {2}";
        }
        {
          type = "disk";
          key = " ";
          format = "{1} / {2}";
        }
        {
          type = "custom";
          format = " ────────────────────────────────";
        }
        {
          type = "custom";
          format = " Profile";
        }
        {
          type = "wm";
          key = " 󰖯";
          format = "{}";
        }
        {
          type = "terminal";
          key = " ";
        }
        {
          type = "shell";
          key = " ";
        }
      ];
    };
  };
}
