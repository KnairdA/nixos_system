{ pkgs, ... }:

{
  imports = [
    ./kit.vpn.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  sound.enable = true;

  hardware = {
    opengl= {
      driSupport32Bit = true;
    };

    pulseaudio = {
      enable       = true;
      support32Bit = true;
    };
  };

  services = {
    journald = {
      extraConfig = ''Storage=volatile'';
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
    ntfs3g
  ];
}
