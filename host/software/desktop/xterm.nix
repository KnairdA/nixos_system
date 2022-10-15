{ pkgs, ... }:

{
  services = {
    xserver.lightdm.enable = true;
    desktopManager.xterm.enable = true;
  };
}
