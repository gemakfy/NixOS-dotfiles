{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    languagePacks = [ "ru" ];
    profiles = {
      "gemakfy" = {
        id = 0;
        isDefault = true;

        settings = {
          # disable containers
          "privacy.userContext.enabled" = false;
          "privacy.userContext.ui.enabled" = false;

          # disable bookmarks
          "browser.toolbars.bookmarks.visibility" = "never";
          "places.history.enabled" = false;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.bookmarks.showAllBookmarks" = false;
          "browser.bookmarks.editDialog.showForNewBookmarks" = false;
          "DisplayBookmarksToolbar" = "never";

          # other settings
          "browser.search.isUS" = true;
          "distribution.searchplugins.defaultLocale" = "en-US";
          "browser.search.region" = "US";
          "general.useragent.locale" = "en-US";
          "browser.download.useDownloadDir" = false;
        };

        search = {
          default = "duckduckgo";
          order = [ "google" "Nix Packages" "Nix Options" "Home-manager Options" ];
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              definedAliases = [ "@no" ];
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };

            "Home-manager Options" = {
              definedAliases = [ "@ho" ];
              urls = [{
                template = "https://home-manager-options.extranix.com/";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
            };
          };
        };
      };
    };
  };
}
