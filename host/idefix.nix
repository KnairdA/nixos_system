{ pkgs, ... }:

{
  imports = [
    ./hardware/idefix.nix
    ./software/desktop
    ./software/desktop/gnome.nix
  ];

  console.keyMap = pkgs.lib.mkForce "us";

  networking = {
    hostName = "idefix";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  users.extraUsers.common.extraGroups  = [ "networkmanager" ];

  services = {
    upower.enable = true;
    acpid.enable  = true;
    blueman.enable = true;
    xserver.libinput.enable = true;
  };

  powerManagement.powertop.enable = true;

  services.xserver = {
    layout = pkgs.lib.mkForce "us";
    xkbVariant = pkgs.lib.mkForce "";
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.8/24" ];

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        { # automatix
          publicKey  = "B0tkjq+5SfECKx1gWEP5JVWOIaRWL2JNE7iSpMmN4F0=";
          allowedIPs = [ "10.100.0.0/24" ];
          endpoint   = "kummerlaender.eu:54321";

          persistentKeepalive = 10;
        }
      ];
    };
  };

  system.stateVersion = "22.05";
}
