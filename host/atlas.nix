{ pkgs, ... }:

{
  imports = [
    ./hardware/atlas.nix
    ./software/desktop
    ./software/desktop/xterm.nix
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

    nvidia-container-toolkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

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
        limit = 1;
      };
    };
  };

  systemd.services.gitlab-runner.serviceConfig = {
    CPUWeight = "idle";
    CPUQuota = "800%";
  };

  users.users.gitlab-runner.isNormalUser = true;
  nix.settings.allowed-users = [ "gitlab-runner" ];

  system.stateVersion = "23.11";
}
