{ pkgs, ... }:
{
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      telegram-jail = {
        executable = "${pkgs.telegram-desktop}/bin/Telegram";
        profile = "${pkgs.firejail}/etc/firejail/telegram.profile";
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
      lunarclient-jail = {
        executable = "${pkgs.gamemode}/bin/gamemoderun ${pkgs.lunar-client}/bin/lunarclient";
        profile = null;
        extraArgs = [
          "--noprofile"
          "--caps.drop=all"
          "--private-tmp"
          "--disable-mnt"
          "--ipc-namespace"
          "--protocol=unix,inet,inet6"

          "--dbus-user=filter"
          "--dbus-user.talk=com.feralinteractive.GameMode"
          "--dbus-user.talk=org.freedesktop.StatusNotifierWatcher"
          "--dbus-user.talk=org.kde.StatusNotifierWatcher"
          "--dbus-user.talk=org.freedesktop.Notifications"

          "--mkdir=~/.lunarclient"
          "--mkdir=~/.minecraft"
          "--mkdir=~/.config/Lunar Client"
          "--whitelist=~/.lunarclient"
          "--whitelist=~/.minecraft"
          "--whitelist=~/.config/Lunar Client"
        ];
      };
      vesktop-jail = {
        executable = "${pkgs.vesktop}/bin/vesktop";
        profile = null;
        extraArgs = [
          "--noprofile"
          "--caps.drop=all"
          "--private-tmp"
          "--disable-mnt"
          "--ipc-namespace"
          "--protocol=unix,inet,inet6"

          "--dbus-user=filter"
          "--dbus-user.talk=org.freedesktop.StatusNotifierWatcher"
          "--dbus-user.talk=org.kde.StatusNotifierWatcher"
          "--dbus-user.talk=org.freedesktop.Notifications"
          "--dbus-user.talk=org.freedesktop.portal.Desktop"
          "--dbus-user.talk=org.freedesktop.portal.ScreenCast"

          "--mkdir=~/.config/vesktop"
          "--whitelist=~/.config/vesktop"
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
