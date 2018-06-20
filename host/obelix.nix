{
  imports = [ ./hardware/obelix.nix ];

  boot = {
    kernelParams = [ "vga=0x31B" ];

    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sdb";
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
