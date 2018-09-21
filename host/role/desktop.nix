{ pkgs, ... }:

{
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  sound.enable = true;
  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable       = true;
      support32Bit = true;
    };
  };

  services = {
    journald = {
      extraConfig = ''Storage=volatile'';
    };

    openvpn.servers = {
      KIT = {
        config = import ./conf/vpn/kit.ovpn.nix;
        autoStart = false;
      };
    };

    xserver = {
      enable = true;
      layout = "de";
      xkbOptions = "caps:escape";

      displayManager.slim = {
        enable = true;
        autoLogin = true;
        defaultUser = "common";
      };

      desktopManager.default = "none";
    };
  };

  environment.systemPackages = with pkgs; [
    hdparm ntfs3g 
  ];
}
