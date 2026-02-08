{
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {
      align = {};
      pairs.enable = true;
      basics = {
        options.extra_ui = true;
      };
      clue = {};
      cursorword = {};
      doc = {};
      extra = {};
      indentscope = {};
      trailspace = {};
      misc = {};
      surround = {};
      icons = {};
    };
    mockDevIcons = true;
  };
}
