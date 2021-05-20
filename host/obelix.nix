{ pkgs, ... }:

{
  imports = [
    ./hardware/obelix.nix
    ./software/desktop
    ./software/server/build.nix
  ];

  boot = {
    loader.grub = {
      enable  = true;
      version = 2;
      device  = "/dev/sda";
      extraConfig = ''
        set gfxpayload=1920x1200x32
      '';
    };

    initrd.luks.devices = {
      root = {
        device = "/dev/disk/by-uuid/6205da24-b1b2-402c-b175-4036e678dea9";
        preLVM        = true;
        allowDiscards = true;
      };
    };
  };

  networking = {
    hostName = "obelix";
    firewall.enable = false;
  };

  services.xserver.videoDrivers = [ "nvidiaBeta" ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/24" ];

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        { # automatix
          publicKey  = "B0tkjq+5SfECKx1gWEP5JVWOIaRWL2JNE7iSpMmN4F0=";
          allowedIPs = [ "10.100.0.0/24" ];
          endpoint   = "kummerlaender.eu:54321";

          persistentKeepalive = 10;
        }
      ];
    };
  };

  system.stateVersion = "18.09";
}
