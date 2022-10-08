{ pkgs, ... }:

{
  imports = [
    ./hardware/majestix.nix
    ./software/desktop
    ./software/server/runner.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices = {
      encrypted = {
        device = "/dev/nvme0n1p2";
        preLVM        = true;
        allowDiscards = true;
      };
    };
  };

  networking = {
    hostName = "majestix";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    zenith-nvidia
    virt-manager
  ];

  users.extraUsers.common.extraGroups  = [ "networkmanager" "libvirtd" ];

  services = {
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };

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

  nix = {
    maxJobs = 32;
    trustedUsers = [ "root" "common" ];
  };

  system.stateVersion = "20.09";
}
