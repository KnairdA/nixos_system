{ pkgs, ... }:

{
  imports = [ ./hardware/automatix.nix ];

  boot.loader.grub = {
    enable  = true;
    version = 2;
    device  = "/dev/sda"; 
  };

  networking.hostName = "automatix";
}
