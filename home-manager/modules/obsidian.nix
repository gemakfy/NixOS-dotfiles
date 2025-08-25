{ pkgs, ... }:

{
  programs.obsidian = {
    enable = true;

    vaults = {
      obsidian-vault = {
        enable = true;
        target = "Documents/obsidian-vault";
        settings = {
          themes = [
            {
              pkg = pkgs.fetchFromGitHub {
                owner = "AllJavi";
                repo = "material_gruvbox_obsidian";
                rev = "35b5bc1d7f857cecfc87bab4bfe74e3de11f4d11";
                sha256 = "1zq6wk09dq9yba0q1gv86y1adhycl26lz45n7vkq9lqs022gzkk2";
              };
              enable = true;
            }
          ];
        };
      };
    };
  };
}
