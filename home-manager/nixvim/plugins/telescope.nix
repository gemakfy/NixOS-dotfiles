{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Live grep";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Find buffers";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Help tags";
      };
      "<leader>fd" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
    };
  };
}
