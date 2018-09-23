{ config, pkgs, ... }:

{
  system.stateVersion = "18.03";

  imports = [
    ./host/current.nix
    ./host/software/vim.nix
    ./host/software/fish.nix
    ./user/common.nix
  ];

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

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "no";
  };

  environment = {
    systemPackages = with pkgs; [
      psmisc htop git silver-searcher
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
