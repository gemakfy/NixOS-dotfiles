{pkgs, ...}: {
  services = {
    displayManager = {
      defaultSession = "hyprland";
      autoLogin.enable = true;
      autoLogin.user = "gemakfy";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };
}
