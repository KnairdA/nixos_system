{ pkgs, ... }:

{
  imports = [
    ./hardware/athena.nix
    ./software/desktop
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
    hostName = "athena";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" "libvirtd" ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.4/24" ];

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

  services = {
    upower.enable = true;
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "modesetting" ];

      synaptics = {
        enable = true;
        twoFingerScroll  = true;
        horizontalScroll = false;
        palmDetect       = true;
        minSpeed         = "1.5";
      };
    };

    printing.enable = true;

    avahi = {
      enable  = true;
      nssmdns = true;
    };
  };

  virtualisation.libvirtd.enable = true;

  hardware.trackpoint = {
    enable       = true;
    emulateWheel = true;
    speed        = 250;
  };

  hardware.bluetooth.enable = true;

  hardware.opengl.extraPackages = [ pkgs.intel-ocl ];

  services.tlp = {
    enable = true;
    extraConfig = ''
     RESTORE_DEVICE_STATE_ON_STARTUP=1
     DEVICES_TO_DISABLE_ON_STARTUP="wwan"
    '';
  };

  powerManagement.powertop.enable = true;

  console = {
    earlySetup = true;
    font = "ter-132n";
    packages = [ pkgs.terminus_font ];
  };
}
