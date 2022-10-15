{ pkgs, ... }:

{
  imports = [
    ./hardware/idefix.nix
    ./software/desktop
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
  };

  powerManagement.powertop.enable = true;

  services.xserver = {
    layout = pkgs.lib.mkForce "us";
    xkbVariant = pkgs.lib.mkForce "";

    libinput.enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    simple-scan
    geary
    tali
    iagno
    hitori
    atomix
  ]);

  environment.systemPackages = with pkgs.gnomeExtensions; [
    gesture-improvements
    pop-shell
  ];

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
