{ pkgs, ... }:

{
  environment.systemPackages = let
    custom_vim  = import ./pkgs/vim/default.nix pkgs;
  in [
    custom_vim
  ];
}
