{
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        ioprio = 0;
        renice = 10;
      };

      cpu = {
        governor = "performance";
        energy_perf_bias = "performance";
        min_perf_pct = "100";
      };
    };
  };
  powerManagement.cpuFreqGovernor = "performance";
}
