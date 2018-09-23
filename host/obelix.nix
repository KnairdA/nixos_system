{ pkgs, ... }:

{
  imports = [
    ./hardware/obelix.nix
    ./software/desktop.nix
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

  systemd.services.spin-down-storage = {
    enable = true;
    description = "Spin down storage drive";
    serviceConfig = {
      Type      = "oneshot";
      ExecStart = "${pkgs.hdparm}/bin/hdparm -q -S 120 -y /dev/disk/by-label/storage";
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking = {
    hostName = "obelix";
    firewall.enable = false;
  };

  services.xserver.videoDrivers = [ "nvidiaBeta" ];
}
