{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    history.size = 1000000;
    syntaxHighlighting.enable = true;

    initContent = ''
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
      eval "$(zoxide init --cmd cd zsh)"
      export PATH="$HOME/.cargo/bin:$PATH"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases =
      let
        flake = "--flake ~/nix";
      in
      {
        rb = "sudo nixos-rebuild switch ${flake}";
        hms = "home-manager switch ${flake}";
        grb = "sudo nix-collect-garbage";
        upd = "sudo nixos-rebuild switch --upgrade ${flake}";
        generations = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
        ff = "fastfetch";
        a = "yazi";
        cc = "clear";
        v = "nvim";
        f = "nvim $(fzf)";
      };
  };
}
