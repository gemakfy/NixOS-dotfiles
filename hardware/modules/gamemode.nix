{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        ioprio = 0;
        renice = 15;
      };

      cpu = {
        governor = "performance";
        energy_perf_bias = "performance";
      };
    };
  };
  powerManagement.cpuFreqGovernor = "performance";
}
