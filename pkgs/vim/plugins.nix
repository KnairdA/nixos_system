{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  "vim-csexact" = buildVimPlugin {
    name = "vim-csexact";
    src = fetchgit {
      url    = "https://github.com/KevinGoodsell/vim-csexact";
      rev    = "d694a55e8daee475bdf4748a1ef7c1562b581476";
      sha256 = "1kwpxk68prdpzw4b7mpfwh2vq99gfymr544wzwcm072h2x89s1dv";
    };
  };
  "vim-color-akr" = buildVimPlugin {
    name = "vim-csexact";
    src = ./conf/vim-color-akr;
  };
}
