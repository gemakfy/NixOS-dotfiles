{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  #system.autoUpgrade.enable = true;

  nix.optimise = {
    automatic = true;
    dates = [ "monthly" ];
  };
}
