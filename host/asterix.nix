{ pkgs, ... }:

{
  imports = [
    ./hardware/asterix.nix
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
      preLVM        = true;
      allowDiscards = true;
    } ];
  };

  networking = {
    hostName = "asterix";
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

  system.stateVersion = "18.09";
}
