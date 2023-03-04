{ config, lib, pkgs, modulesPath, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    initrd = {
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      # Enable swap on luks
      luks.devices."luks-3a4818e8-af59-45de-9777-131c7a083d53" = {
        device = "/dev/disk/by-uuid/3a4818e8-af59-45de-9777-131c7a083d53";
        keyFile = "/crypto_keyfile.bin";
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1e96455d-e8dd-4510-9e3d-e5f872d785f9";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-e3fe3335-82a9-4fcb-b45e-bee2f6382238".device = "/dev/disk/by-uuid/e3fe3335-82a9-4fcb-b45e-bee2f6382238";

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/7ABB-606F";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/4951a94e-7a95-4148-b6d8-9f3f7d1c195f"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
