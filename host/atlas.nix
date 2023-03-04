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

  hardware.nvidia.package = pkgs.linuxPackages.nvidia_x11;

  environment.systemPackages = with pkgs; [
    zenith-nvidia
    nvtop
  ];

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
    autoPrune = {
      enable = true;
      dates = "daily";
    };
  };
  users.users.common.extraGroups = [ "docker" ];

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

  services.gitlab-runner = {
    enable = true;
    services = {
      openlb-ci = {
        executor = "shell";
        registrationConfigFile = "/etc/gitlab-runner.conf";
        tagList = [ "nix" "has-gpu" ];
        limit = 1;
      };
    };
  };

  systemd.services.gitlab-runner.serviceConfig = {
    CPUQuota   = "400%";
    MemoryHigh = "8G";
  };

  users.users.gitlab-runner.isNormalUser = true;
  nix.settings.allowed-users = [ "gitlab-runner" ];

  system.stateVersion = "22.11";
}