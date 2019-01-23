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

    initrd.luks.devices = [ {
      name   = "encrypted";
      device = "/dev/nvme0n1p2";
      preLVM        = true;
      allowDiscards = true;
    } ];
  };

  networking = {
    hostName = "athena";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" ];

  services = {
    upower.enable = true;
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "intel" ];

      synaptics = {
        enable = true;
        twoFingerScroll  = true;
        horizontalScroll = false;
        palmDetect       = true;
      };
    };
  };

  hardware.trackpoint = {
    enable       = true;
    emulateWheel = true;
    speed        = 128;
  };

  powerManagement.powertop.enable = true;
}
