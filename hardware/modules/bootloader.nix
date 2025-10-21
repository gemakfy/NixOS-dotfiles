{ pkgs, config, ... }:
{
  boot = {
    # enable silent boot
    consoleLogLevel = 0; # disable systemd logs
    initrd.verbose = false;

    kernelParams = [
      # silent boot
      "quiet"
      "splash"
      "loglevel=3"
      "udev.log_level=3"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false; # for lanzaboote
      # Lanzaboote currently replaces the systemd-boot module.
    };

    # lanzaboote (secure boot)
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  # For debugging and troubleshooting Secure Boot.
  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
