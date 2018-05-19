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
  "vim-counterpoint" = buildVimPlugin {
    name = "vim-counterpoint";
    src  = fetchgit {
      url    = "https://github.com/jpetrie/vim-counterpoint";
      rev    = "93d8fd9d18a378ab3db39411300716129358211c";
      sha256 = "02spr4mhj2035q45j8bf502jgpq76a518nv913zx46byfbl69lps";
    };
  };
  "vim-bufferlist" = buildVimPlugin {
    name = "vim-bufferlist";
    src  = fetchgit {
      url    = "https://github.com/roblillack/vim-bufferlist";
      rev    = "bb571a6dcbf19aa72d320545d376e1d13a8853a3";
      sha256 = "0ddp9lzl5yv6xwqrqy0dzvd9b5igf6dm5pbyrl2bm0bg586zx3gr";
    };
  };
  "vim-color-akr" = buildVimPlugin {
    name = "vim-csexact";
    src  = ./conf/vim-color-akr;
  };
}
