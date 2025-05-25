{ pkgs, ... }: {

  #users.defaultUserShell = pkgs.zsh;

  users.users.gemakfy = {
    isNormalUser = true;
    description = "gemakfy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  users.users.test = {
    isNormalUser = true;
    description = "user for tests";
    home = "/home/test";
    extraGroups = [ ];
    shell = pkgs.bash;
    createHome = true;
    homeMode= "0700";
  };
}
