{ pkgs, ... }:

{
  imports = [
    ./hardware/automatix.nix

    ./software/server/git.nix
    ./software/server/mail.nix
    ./software/server/website.nix
  ];

  boot.loader.grub = {
    enable  = true;
    version = 2;
    device  = "/dev/sda";
  };

  networking = {
    hostName = "automatix";

    firewall = {
      enable = true;
    # open Nginx ports, other services open their own ports
      allowedTCPPorts = [ 80 443 ];
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

    syncthing = {
      enable = true;
      group  = "users";
      openDefaultPorts = true;
    };
  };
}
