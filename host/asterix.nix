{
  imports = [ ./hardware/asterix.nix ];

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

  services.xserver = {
    videoDrivers = [ "intel" ];

    synaptics = {
      enable = true;
      twoFingerScroll = true;
      palmDetect = true;
    };
  };
}
