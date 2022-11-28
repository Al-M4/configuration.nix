{ config, pkgs, ... }:
{
  # Enable docker service
  #virtualisation.docker.enable = true;

  # Virt-manager
  #virtualisation.libvirtd.enable = true;
  #virtualisation.libvirtd.qemu.runAsRoot = false;
  #programs.dconf.enable = true;
  #environment.systemPackages = with pkgs; [ virt-manager ];
  #users.users.master-x.extraGroups = [ "libvirtd" ];
  #virtualisation.podman.enable = true;
  #services.dnsmasq.extraConfig = ''
  #  interface=lo
  #  interface=enp8s0
  #  bind-interfaces
  #'';

  # Quickemu
  environment.systemPackages = with pkgs; [ 
    quickemu
    samba
  ];
}
