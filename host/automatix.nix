{ pkgs, ... }:

{
  imports = [
    ./hardware/automatix.nix

    ./software/server/git.nix
    ./software/server/mail.nix
    ./software/server/website.nix
    ./software/server/wireguard.nix
  ];

  boot.loader.grub = {
    enable  = true;
    version = 2;
    device  = "/dev/sda";
  };

  nix.allowedUsers = [ "public" ];

  networking = {
    hostName = "automatix";

    firewall = {
      enable = true;
    # open Nginx ports, other services open their own ports
      allowedTCPPorts = [ 80 443 ];
    };

  # setup IPv6
    interfaces.ens3.ipv6.addresses = [ {
      address = "2a01:4f8:c010:f56::1";
      prefixLength = 64;
    } ];

    defaultGateway6 = {
      address   = "fe80::1";
      interface = "ens3";
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

  security.acme = {
    acceptTerms = true;
    email = "key@kummerlaender.eu";
  };
}
