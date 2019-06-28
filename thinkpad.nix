{ config, lib, pkgs, ... }:
{
  services = {
    tlp = {
      enable = true;
      extraConfig = ''
        # Needed for either SSD or btrfs.
        SATA_LINKPWR_ON_BAT=max_performance
        START_CHARGE_THRESH_BAT0=31
        STOP_CHARGE_THRESH_BAT0=81 
      '';
    };
   # xserver.xkbModel = "thinkpad60";
  };

  boot = {
    kernelModules = [ 
      #"tp_smapi" 
      "thinkpad_acpi" 
      #"fbcon" 
      #"i915" 
      "acpi_call" 
    ];
    extraModulePackages = with config.boot.kernelPackages; [ 
     # tp_smapi 
      acpi_call 
    ];
  };

  #systemd.services = {
  #  battery_threshold = {
  #    description = "Set battery charging thresholds.";
  #    path = [ pkgs.tpacpi-bat ];
  #    after = [ "basic.target" ];
  #    wantedBy = [ "multi-user.target" ];
  #    script = ''
  #      tpacpi-bat -s ST 1 39
  #      tpacpi-bat -s ST 2 39
  #      tpacpi-bat -s SP 1 80
  #      tpacpi-bat -s SP 2 80
  #    '';
  #  };
  #};
}
