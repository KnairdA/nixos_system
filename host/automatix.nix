{ pkgs, ... }:

{
  imports = [
    ./hardware/automatix.nix
    ./software/code.kummerlaender.eu.nix
    ./software/pkgs.kummerlaender.eu.nix
    ./software/blog.kummerlaender.eu.nix
    ./software/tree.kummerlaender.eu.nix
    ./software/mx.kummerlaender.eu.nix
  ];

  boot.loader.grub = {
    enable  = true;
    version = 2;
    device  = "/dev/sda";
  };

  networking = {
    hostName = "automatix";

    firewall = {
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

  services = {
    nginx = {
      enable = true;

      recommendedGzipSettings  = true;
      recommendedOptimisation  = true;
      recommendedProxySettings = true;
      recommendedTlsSettings   = true;
    };
  };
}
