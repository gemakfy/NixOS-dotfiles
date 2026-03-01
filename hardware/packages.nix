{ pkgs, ... }:
{
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

    # CLI utils
    ansible
    vim
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
    qemu # virtualization
    quickemu

    # IP utils
    whois
    mtr
    traceroute
    dig
  ];
}
