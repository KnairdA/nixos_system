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
