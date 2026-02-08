{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;

      # +-------------------------------------------------+
      # | A | B | C                             X | Y | Z |
      # +-------------------------------------------------+

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [
          "filename"
          "diff"
        ];

        lualine_x = [
          "diagnostics"
          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };
}
