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
  "vim-color-akr" = buildVimPlugin {
    name = "vim-color-akr";
    src  = ./conf/vim-color-akr;
  };
}
