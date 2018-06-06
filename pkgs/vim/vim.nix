{ pkgs, ... }:

let
  custom_vim = pkgs.vim_configurable.customize {
    name        = "vim";
    vimrcConfig = (import ./custom.nix { pkgs = pkgs; });
  };
in pkgs.lib.overrideDerivation custom_vim ( o: {
    gui              = true;
    multibyteSupport = true;
} )
