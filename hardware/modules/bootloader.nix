{ pkgs, config, ... }:
{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    # enable silent boot
    consoleLogLevel = 0; # disable systemd logs
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "udev.log_level=3"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        device = "nodev";
        enable = true;
        efiSupport = true;
        useOSProber = true;

        gfxmodeEfi = "2560x1440";
        gfxpayloadEfi = "keep";
        milk-theme.enable = true;
      };
    };
  };
}
