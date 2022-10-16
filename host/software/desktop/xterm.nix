{ pkgs, ... }:

{
  services.xserver = {
    displayManager.lightdm.enable = true;
    desktopManager.xterm.enable = true;
  };
}
