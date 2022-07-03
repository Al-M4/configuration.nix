# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/24153d81-9975-443b-b9a9-c9fe0943ba26";
      preLVM = true;
    };
  };


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9645e7fb-e65a-4dd6-98cc-405d07ebc68d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2986-6239";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/732ce809-5070-4d02-bfe0-1b599203b1ce"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}