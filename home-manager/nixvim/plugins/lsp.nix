{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        folding.enable = true;
        indent.enable = true;
      };
    };

    hmts.enable = true;

    lsp = {
      enable = true;
      servers = {
        pylsp = {
          enable = true;
          settings.plugins = {
            flake8 = {
              enabled = true;  # Enable Flake8
              maxLineLength = 120;
              showsource = true;
            };
          };
        };
      };
    };
    lsp-lines.enable = true;
    lsp-format.enable = true;
  };
}
