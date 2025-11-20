{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    settings = {
      filesystem.follow_current_file.enabled = true;
      close_if_last_window = true;
    };
  };
}
