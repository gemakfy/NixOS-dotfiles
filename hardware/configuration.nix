{ config, pkgs, lib,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./wayland-packages.nix
      ./modules/nvidia.nix
      ./modules/user.nix
      ./modules/locales.nix
      ./modules/collect-garbage.nix
      ./modules/pipewire.nix
      ./modules/systemd.nix
      ./modules/sddm/sddm.nix
      ./modules/bootloader.nix
      ./modules/zram.nix
      ./modules/gamemode.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
  };

  services.flatpak.enable = true;
  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    EDITOR = "nvim";
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true; # enable networking
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    hyprland.xwayland.enable = true;
    hyprland.enable = true; # enable hyprland
    zsh.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    firejail = {
      enable = true;
      wrappedBinaries = {
        ayugram-jail = {
          executable = "${pkgs.ayugram-desktop}/bin/AyuGram";
          profile = "${pkgs.firejail}/etc/firejail/telegram.profile";
          extraArgs = [
            "--whitelist=~/.local/share/AyuGramDesktop"
            "--caps.drop=all"
            "--nonewprivs"
            "--dbus-user=filter"
            "--protocol=unix,inet,inet6"
          ];
        };
        spotify-jail = {
          executable = "/home/gemakfy/.nix-profile/bin/spotify";
          profile = "${pkgs.firejail}/etc/firejail/spotify.profile";
          extraArgs = [
            "--caps.drop=all"
            "--nonewprivs"
            "--dbus-user=filter"
            "--protocol=unix,inet,inet6"
          ];
        };
      };
    };
  };

  system.stateVersion = "24.11"; # Did you read the comment?

}
