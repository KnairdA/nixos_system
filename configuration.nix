{ config, pkgs, ... }:

{
  system.stateVersion = "18.03";

  imports = [
    ./hardware-configuration.nix
    ./conf/fish.nix
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking = {
    hostName = "obelix";
    firewall.enable = false;
  };

  sound.enable = true;
  hardware = {
    pulseaudio.enable      = true;
    opengl.driSupport32Bit = true;
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

    xserver = {
      enable = true;
      layout = "de";
      xkbOptions = "caps:escape";

      videoDrivers = [ "nvidia" ];

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

  environment.systemPackages = let
    custom_vim = import ./pkgs/vim/vim.nix pkgs;
  in with pkgs; [
    ntfs3g htop fish custom_vim
  ];
}
