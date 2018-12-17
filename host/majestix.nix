{ pkgs, ... }:

{
  imports = [
    ./hardware/majestix.nix
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
      preLVM = true;
    } ];
  };

  networking = {
    hostName = "majestix";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" ];

  services = {
    acpid.enable  = true;

    xserver = {
      videoDrivers = [ "intel" ];
    };

    printing = {
      enable = true;
      drivers = [ pkgs.brgenml1cupswrapper ];
    };

    avahi = {
      enable = true;
      nssmdns = true;
    };
  };
}
