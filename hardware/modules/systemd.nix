{
  #journald minimize logs
  services.journald = {
    settings.Journal = {
      SystemMaxUse = "50M";
      SystemMaxFiles = 5;
      RateLimitBurst = 500;
      RateLimitIntervalSec = "30s";
    };
  };
}
