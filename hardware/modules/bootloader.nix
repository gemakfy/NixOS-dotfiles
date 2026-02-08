{pkgs, ...}: {
  boot = {
    initrd.systemd.enable = true;
    initrd.kernelModules = ["nvidia"];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false; # for lanzaboote
      timeout = 1;
      # Lanzaboote currently replaces the systemd-boot module.
    };

    # lanzaboote (secure boot)
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  # TPM
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  users.users.gemakfy.extraGroups = ["tss"]; # tss group has access to TPM devices

  # For debugging and troubleshooting Secure Boot.
  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
