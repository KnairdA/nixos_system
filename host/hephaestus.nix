{ pkgs, ... }:

{
  imports = [
    ./hardware/hephaestus.nix
    ./software/desktop
    ./software/desktop/xterm.nix
    ./software/desktop/teensy.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices = {
      encrypted = {
        device = "/dev/nvme0n1p5";
        preLVM        = true;
        allowDiscards = true;
      };
    };
  };

  networking = {
    hostName = "hephaestus";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  hardware.nvidia.package = pkgs.linuxPackages.nvidia_x11;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  users.users.common.extraGroups = [ "docker" ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.7/24" ];

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

  console.earlySetup = true;

  system.stateVersion = "21.05";
}
