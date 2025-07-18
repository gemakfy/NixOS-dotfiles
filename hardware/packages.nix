{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #Desktop apps
    anydesk
    librewolf
    prismlauncher
    ayugram-desktop
    vesktop
    spotify
    obs-studio
    chromium
    vlc
    recaf-launcher
    obsidian

    # Python
    python313
    python313Packages.flake8
    zed-editor

    # CLI utils
    vim
    #neovim
    zsh
    oh-my-zsh
    fastfetch
    btop
    unzip
    zip
    unrar
    git
    yazi # TUI
    zoxide # modern "cd"
    eza # modern "ls"
    fzf # file search
    zathura # vim-like pdf reader
    playerctl
    firejail # namespace-based sandboxing
    protonup # for steam
    flatpak
    docker
    cmatrix
    cava
    qemu # virtualization
    quickemu

    # IP utils
    dnscrypt-proxy2
    nftables
    ipset
    # Test domain
    whois
    mtr
    dig
    traceroute
    dig
  ];
}
