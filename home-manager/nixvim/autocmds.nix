{
  programs.nixvim.autoCmd = [
    # Highlight on yank
    {
      event = [ "TextYankPost" ];
      pattern = [ "*" ];
      callback.__raw = "function() vim.highlight.on_yank({higroup = 'IncSearch', timeout = 200}) end";
    }

    {
      event = [ "FileType" ];
      pattern = [ "python" ];
      command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab";
    }

    {
      event = [ "FileType" ];
      pattern = [
        "yaml"
        "nix"
      ];
      command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab";
    }
  ];
}
