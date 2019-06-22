{ pkgs, ... }:

{
  imports = [
    ./hardware/majestix.nix
    ./software/desktop
  ];

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };

    initrd.luks.devices = [ {
      name   = "encrypted";
      device = "/dev/sda2";
      preLVM = true;
    } ];
  };

  networking = {
    hostName = "majestix";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" ];

  services = {
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "intel" ];
    };

    printing = {
      enable = true;
      drivers = [ pkgs.brgenml1cupswrapper ];
    };

    avahi = {
      enable = true;
      nssmdns = true;
    };
  };

  hardware.opengl.extraPackages = [ pkgs.intel-ocl ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.3/24" ];

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
}
