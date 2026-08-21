{ pkgs, ... }:
{
  security = {
    protectKernelImage = true;
  };

  boot = {
    initrd.systemd.enable = true;
    initrd.kernelModules = [ "nvidia" ];


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

    # hardening
    kernelParams = [
      "slab_nomerge"
      "page_alloc.shuffle=1"
      "debugfs=off"
    ];

    kernel.sysctl = {
      "kernel.kptr_restrict" = 2;
      "kernel.yama.ptrace_scope" = 1;
      "kernel.perf_event_paranoid" = 2;
      "net.core.bpf_jit_harden" = 1;
    };

    blacklistedKernelModules = [
      "ax25"
      "netrom"
      "rose"

      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "freevxfs"
      "hpfs"
      "jfs"
      "minix"
      "nilfs2"
      "qnx4"
      "qnx6"
      "sysv"
      "ufs"
    ];
  };

  # For debugging and troubleshooting Secure Boot.
  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
