{ config, pkgs, pkgs-personal, hostname, ... }:
{
  imports = [
    ./fish.nix
    ./user/common.nix
    (./host + ("/" + hostname + ".nix"))
  ];

  console.keyMap = "de";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixUnstable;

    settings = {
      allowed-users = [ "common" ];
      trusted-users = [ "root" "common" ];
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  networking.nameservers = [
    "1.1.1.1"
    "2606:4700:4700::1111"
  ];

  programs = {
    bash.enableCompletion = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "no";
    forwardX11 = true;
  };

  environment = {
    systemPackages = with pkgs; [
      psmisc
      htop
      git
      p7zip
      silver-searcher
      renameutils
      pkgs-personal.custom-neovim
    ];

    variables = {
      EDITOR = "vim";
    };

    shellAliases = {
      "ls"  = "ls --color=auto --group-directories-first";
      "qmv" = "qmv --format=destination-only";
    };

    shellInit = ''
      export LC_NUMERIC=de_DE.UTF8
      export LC_TIME=de_DE.UTF8
      export LC_MONETARY=de_DE.UTF8
      export LC_MEASUREMENT=de_DE.UTF8
    '';
  };
}
