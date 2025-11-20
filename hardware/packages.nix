{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #Desktop apps
    librewolf
    ayugram-desktop
    vesktop
    spotify
    chromium
    vlc
    qbittorrent
    simplex-chat-desktop

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
    flatpak
    docker
    cmatrix
    cava
    qemu # virtualization
    quickemu

    # IP utils
    dnscrypt-proxy
    nftables
    ipset
    whois
    mtr
    dig
    traceroute
    dig
  ];
}
