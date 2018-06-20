{ config, pkgs, ... }:

{
  system.stateVersion = "18.03";

  imports = [
    ./host/current.nix
    ./conf/fish.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  sound.enable = true;
  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable       = true;
      support32Bit = true;
    };
  };

  i18n = {
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config.allowUnfree = true;

  programs = {
    bash.enableCompletion = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services = {
    openssh = {
      enable = true;
    };

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

  users.extraUsers.common = {
    isNormalUser = true;
    uid          = 1000;
    extraGroups  = [ "wheel" ];
    shell        = pkgs.fish;
  };

  environment = {
    systemPackages = let
      custom_vim  = import ./pkgs/vim/vim.nix pkgs;
    in with pkgs; [
      hdparm ntfs3g psmisc htop fish git silver-searcher custom_vim
    ];

    shellAliases = {
      "ls" = "ls --color=auto --group-directories-first";
    };

    shellInit = ''
      export LC_NUMERIC=de_DE.UTF8
      export LC_TIME=de_DE.UTF8
      export LC_MONETARY=de_DE.UTF8
      export LC_MEASUREMENT=de_DE.UTF8
    '';
  };
}
