{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #Desktop apps
    tor-browser
    telegram-desktop
    vesktop
    spotify
    chromium
    vlc
    qbittorrent
    simplex-chat-desktop
    lunar-client
    v2rayn

    # Python
    python314
    python314Packages.flake8
    zed-editor

    # CLI utils
    ansible
    vim
    #neovim
    zsh
    oh-my-zsh
    fastfetch
    btop
    unzip
    zip
    _7zz
    unrar
    git
    yazi # TUI
    zoxide # modern "cd"
    eza # modern "ls"
    fzf # file search
    zathura # vim-like pdf reader
    playerctl
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
