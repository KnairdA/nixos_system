{ pkgs, ... }:

let
  nvim = pkgs.neovim.override {
    vimAlias  = false;
    configure = (import ./custom.nix { pkgs = pkgs; });
  };
in [
  nvim
  pkgs.ctags
  pkgs.git
]
