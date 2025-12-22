{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    wayland = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      historyShortcut
      shuffle
      fullAppDisplay
    ];
  };
}
