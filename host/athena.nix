{ pkgs, ... }:

{
  imports = [
    ./hardware/athena.nix
    ./software/desktop
    ./software/desktop/xterm.nix
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
      videoDrivers = [ "nvidia" ];

      synaptics = {
        enable = true;
        twoFingerScroll  = true;
        horizontalScroll = false;
        palmDetect       = true;
        minSpeed         = "1.5";
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    avahi = {
      enable  = true;
      nssmdns = true;
    };
  };

  hardware.nvidia = {
    package = pkgs.linuxPackages.nvidia_x11;
    prime = {
      offload.enable = true;

      intelBusId  = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    powerManagement.enable = true;
  };

  environment.systemPackages = [
    pkgs.zenith-nvidia
    pkgs.virt-manager
    (pkgs.writeScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec -a "$0" "$@"
    '')
  ];

  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enable = true;
      enableNvidia = true;
    };
  };
  users.users.common.extraGroups = [ "docker" ];

  hardware.trackpoint = {
    enable       = true;
    emulateWheel = true;
    speed        = 250;
  };

  hardware.bluetooth.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      RESTORE_DEVICE_STATE_ON_STARTUP = 1;
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0  = 85;
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      ENERGY_PERF_POLICY_ON_BAT = "powersave";
    };
  };

  powerManagement.powertop.enable = true;

  system.stateVersion = "21.11";
}
