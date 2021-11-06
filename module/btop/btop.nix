{ config, pkgs, ... }:
with import <nixpkgs> { };
let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in 
{
    environment.systemPackages = with pkgs; [
        unstable.btop
    ];
}