{ pkgs, ... }:
{
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      ayugram-jail = {
        executable = "${pkgs.ayugram-desktop}/bin/AyuGram";
        profile = "${pkgs.firejail}/etc/firejail/telegram.profile";
        extraArgs = [
          "--whitelist=~/.local/share/AyuGramDesktop"

          "--caps.drop=all"
          "--nonewprivs"
          "--private-dev"
          "--private-tmp"
          "--ipc-namespace"
          "--noexec=/tmp"
          "--disable-mnt"
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
          "--private-dev"
          "--private-tmp"
          "--ipc-namespace"
          "--noexec=/tmp"
          "--disable-mnt"
          "--dbus-user=filter"
          "--protocol=unix,inet,inet6"
        ];
      };
      obsidian-jail = {
        executable = "${pkgs.obsidian}/bin/obsidian";
        profile = "${pkgs.firejail}/etc/firejail/obsidian.profile";
        extraArgs = [
          "--env=ELECTRON_DISABLE_SANDBOX=1"

          "--net=none"
          "--nodbus"
          "--caps.drop=all"
          "--nonewprivs"
          "--seccomp"
          "--private-dev"
          "--private-tmp"
          "--ipc-namespace"
          "--noexec=/tmp"
          "--disable-mnt"
        ];
      };
    };
  };
}
