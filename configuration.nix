{ config, pkgs, ... }:

{
  system.stateVersion = "18.03";

  imports = [
    ./host/current.nix
    ./conf/common.nix
    ./conf/fish.nix
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
    permitRootLogin = "no";
  };

  environment = {
    systemPackages = let
      custom_vim  = import ./pkgs/vim/vim.nix pkgs;
    in with pkgs; [
      psmisc htop fish git silver-searcher custom_vim
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
