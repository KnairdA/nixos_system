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

      displayManager = {
        autoLogin = {
          enable = true;
          user   = "common";
        };

        lightdm.enable = true;
      };

      desktopManager.xterm.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = -1; # allow user to perform perf analysis
  };
}
