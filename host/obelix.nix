{ pkgs, ... }:

{
  imports = [
    ./hardware/obelix.nix
    ./software/desktop
  ];

  boot = {
    loader.grub = {
      enable  = true;
      version = 2;
      device  = "/dev/sdb";
      extraConfig = ''
        set gfxpayload=1920x1200x32
      '';
    };

    initrd.luks.devices = [ {
      name   = "root";
      device = "/dev/disk/by-uuid/6205da24-b1b2-402c-b175-4036e678dea9";
      preLVM        = true;
      allowDiscards = true;
    } ];
  };

  networking = {
    hostName = "obelix";
    firewall.enable = false;
  };

  services.xserver.videoDrivers = [ "nvidiaBeta" ];
}
