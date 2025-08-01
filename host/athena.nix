{ pkgs, ... }:

{
  imports = [
    ./hardware/athena.nix
    ./software/desktop
  ];

  networking = {
    hostName = "athena";
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" "libvirtd" ];

  hardware = {
    nvidia = {
      open = true;
      package = pkgs.linuxPackages.nvidia_x11;
      prime = {
        offload.enable = true;

        intelBusId  = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      powerManagement.enable = true;
    };

    graphics.extraPackages = with pkgs; [
      libva
      intel-media-driver
    ];

    nvidia-container-toolkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
    zenith-nvidia
    virt-manager
    (writeScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec -a "$0" "$@"
    '')

    nvidia-vaapi-driver
    intel-media-driver
    vaapiVdpau
    libvdpau-va-gl
  ];

  services = {
    upower.enable = true;
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "nvidia" ];
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user = "common";
      };
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    libinput = {
      enable = true;
      touchpad = {
        accelSpeed = "4.0";
        tapping = false;
        tappingDragLock = false;
        scrollMethod = "twofinger";
        disableWhileTyping = true;
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    avahi = {
      enable  = true;
      nssmdns4 = true;
    };
  };

  programs = {
    niri.enable = true;
    xwayland.enable = true;
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
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

  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "daily";
      };
      # mitigate conflict with some public WLANs
      daemon.settings."default-address-pools" = [
        { "base" = "172.27.0.0/16"; "size" = 24; }
      ];
    };
  };
  users.users.common.extraGroups = [ "docker" ];

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


  system.stateVersion = "21.11";
}
