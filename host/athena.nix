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

  users.extraUsers.common.extraGroups  = [ "networkmanager" "libvirtd" ];

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
        minSpeed         = "1.5";
      };
    };
  };

  virtualisation.libvirtd.enable = true;

  hardware.trackpoint = {
    enable       = true;
    emulateWheel = true;
    speed        = 250;
  };

  services.tlp = {
    enable = true;
    extraConfig = ''
     RESTORE_DEVICE_STATE_ON_STARTUP=1
     DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wwan"
    '';
  };

  powerManagement.powertop.enable = true;

  i18n = {
    consoleFont = "ter-132n";
    consolePackages = [ pkgs.terminus_font ];
  };

  boot.earlyVconsoleSetup = true;
}
