{ config, pkgs, ... }:

{
  system.stateVersion = "18.09";

  imports = [
    ./fish.nix
    ./host/current.nix
    ./user/common.nix
  ];

  i18n = {
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Berlin";

  nixpkgs.config.allowUnfree = true;

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
  };

  environment = {
    systemPackages = let
    # use latest nvim
      nixpkgs-unstable = import <nixpkgs-unstable> { };
      mypkgs = import <mypkgs> { pkgs = nixpkgs-unstable; };
    in [
      pkgs.psmisc
      pkgs.htop
      pkgs.git
      pkgs.silver-searcher
      pkgs.renameutils
      mypkgs.custom-neovim
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
