{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

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

  "vim-mundo" = buildVimPlugin {
    name = "vim-mundo";
    src  = fetchgit {
      url    = "https://github.com/simnalamburt/vim-mundo";
      rev    = "v3.0.1";
      sha256 = "052ywnd5r6ksiz1lsyqya9b94fdb0gr7krkdpc1gw1fx11qk5x2v";
    };
  };

  "vim-toggle-ui-elements" = buildVimPlugin {
    name = "vim-toggle-ui-elements";
    src  = fetchgit {
      url    = "https://github.com/muellan/vim-toggle-ui-elements";
      rev    = "325f60fe8030cc2a2312d67191f214c5c39ef283";
      sha256 = "0fl9kvp799l3nzy8lnjcb0y1hr3g1ba8n9v2mx83yaqdma0rvhi1";
    };
  };

  "vim-git-commit-viewer" = buildVimPlugin {
    name = "vim-git-commit-viewer";
    src  = fetchgit {
      url    = "https://github.com/junegunn/gv.vim";
      rev    = "7ee1ca8201a0e9f95ba5dd3ec344e3ce71d61d8e";
      sha256 = "0r0j8l0sm3xgb3hgmf0zm48mgj97nlkspg3jgv817nhwsl8pyc44";
    };
  };

  "vim-far" = buildVimPlugin {
    name = "vim-far";
    src = fetchgit {
      url    = "https://github.com/brooth/far.vim.git";
      rev    = "5f8016e1df98b1f806e6347728dc012ae59579ab";
      sha256 = "15pcsd039srfvrj2a6f3ns8zh13vrbdx93pcyxzxd8i0vidshkmb";
    };
  };

  "vim-wordmotion" = buildVimPlugin {
    name = "vim-wordmotion";
    src = fetchgit {
      url    = "https://github.com/chaoren/vim-wordmotion.git";
      rev    = "d8cd124a6e36f38f52a43cb9f144eddbc03d300f";
      sha256 = "04ag0ilv8v5h823p685aic9rm8b1l44cs4j5xx4zv1ljg95fx68n";
    };
  };

  "vim-gina" = buildVimPlugin {
    name = "vim-gina";
    src = fetchgit {
      url    = "https://github.com/lambdalisue/gina.vim.git";
      rev    = "v0.3.2";
      sha256 = "06m9cb04qsk49jri3cyw1gr3q71r048pzym10zlqgzsl1jsnvalv";
    };
  };

  "vim-color-akr" = buildVimPlugin {
    name = "vim-color-akr";
    src  = ./asset/vim-color-akr;
  };

}
