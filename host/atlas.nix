{ pkgs, ... }:

{
  imports = [
    ./hardware/atlas.nix
    ./software/desktop
  ];

  networking = {
    hostName = "atlas";
    networkmanager.enable = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  hardware = {
    nvidia = {
      open = true;
      package = pkgs.linuxPackages.nvidia_x11;
    };

    graphics.extraPackages = [ pkgs.libva ];

    nvidia-container-toolkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.full

    nvidia-vaapi-driver
  ];

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "common";
    };
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "daily";
      };
    };

    libvirtd.enable = true;
  };

  users.users.common.extraGroups = [ "docker" ];
  users.groups.libvirtd.members = [ "common" ];

  programs.virt-manager.enable = true;

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
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

  networking.firewall = {
    enable = true;
    interfaces."wg0".allowedTCPPorts = [ 5900 8000 8080 8888 ];
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };

  services.gitlab-runner = {
    enable = true;
    services = {
      openlb-ci = {
        executor = "shell";
        authenticationTokenConfigFile = "/etc/gitlab-runner.conf";
        limit = 2;
      };
    };
  };

  systemd.services.gitlab-runner.serviceConfig = {
    CPUWeight = "idle";
    CPUQuota = "1600%";
  };

  users.users.gitlab-runner.isNormalUser = true;
  nix.settings.allowed-users = [ "gitlab-runner" ];

  system.stateVersion = "23.11";
}
