{ pkgs, ... }:

{
  imports = [
    ./kit.vpn.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  hardware.graphics.enable32Bit = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  services = {
    journald = {
      extraConfig = ''Storage=volatile'';
    };

    xserver = {
      enable = true;
      xkb = {
        options = "caps:escape";
        layout = "de";
      };
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user   = "common";
      };
    };

    gvfs.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  boot.kernel.sysctl = {
    "kernel.perf_event_paranoid" = -1; # allow user to perform perf analysis
  };
}
