{ config, pkgs, ... }:
{
  programs.spicetify = {
    enable = true;
    wayland = true;
  };
}
