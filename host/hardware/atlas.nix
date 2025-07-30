{ config, lib, pkgs, modulesPath, ... }:

{
  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    kernelParams = [ "nvidia-drm.modeset=1" ];


    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/34f1948d-36a7-4c1f-95fe-5dc7dd53a46e";
    fsType = "ext4";
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/02ff6829-07d1-4709-a4ba-6703a214bed4";
    fsType = "ext4";
  };

  boot.initrd.luks.devices = {
    "luks-f6c3a1a8-bc09-4fcd-a979-4fe82dc4dc71".device = "/dev/disk/by-uuid/f6c3a1a8-bc09-4fcd-a979-4fe82dc4dc71";
    "luks-49b6b8ab-1d8f-43d3-ba58-d548316f197a".device = "/dev/disk/by-uuid/49b6b8ab-1d8f-43d3-ba58-d548316f197a";
    "data".device = "/dev/disk/by-uuid/0b324bed-660b-4b9c-b2a3-133ce2531dc7";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D45E-0E82";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/f198c957-dc39-4973-86c0-8fde06672ff9"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
