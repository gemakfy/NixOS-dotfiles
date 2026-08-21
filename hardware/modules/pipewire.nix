{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 44100;
        "default.clock.allowed-rates" = [ 44100 48000 88200 96000 ];
      };
    };

    extraConfig.pipewire."99-fiio-dynamic-rate" = {
      "monitor.alsa.rules" = [
        {
          matches = [ { "node.name" = "~alsa_output.usb-GuangZhou_FiiO.*"; } ];
          actions = {
            update-props = {
              "node.freewheel" = false;
              "audio.rate" = 0;
            };
          };
        }
      ];
    };
  };
}
