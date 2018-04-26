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
  "vim-unimpaired" = buildVimPlugin {
    name = "vim-unimpaired";
    src  = fetchgit {
      url    = "https://github.com/tpope/vim-unimpaired";
      rev    = "bacf1543cc957d47aa70c1dc0bcf99392925b008";
      sha256 = "0jx9xybjswnaa6v7hhfqm2nyd5v54xjd02ikw56wm7h6sfgchllx";
    };
  };
  "vim-color-akr" = buildVimPlugin {
    name = "vim-csexact";
    src  = ./conf/vim-color-akr;
  };
}
