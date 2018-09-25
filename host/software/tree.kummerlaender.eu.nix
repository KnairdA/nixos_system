{ pkgs, ... }:

let
  content = pkgs.fetchgit {
    url    = "gitea@localhost:web/tree_content.git";
    rev    = "1544db46357bc6b03ac82cc47e6f99ec09b82b62";
    sha256 = "05lw3qcqm6jccbp15fcy7nd83pzv9zidpvafr2f7xvr2czi7z2iy";
  };

  result = pkgs.stdenv.mkDerivation {
    name = "tree.kummerlaender.eu";

    src = pkgs.fetchFromGitHub {
      owner  = "KnairdA";
      repo   = "tree.kummerlaender.eu";
      rev    = "95f100c7ac9fba6116f0e268950b83b706325bf2";
      sha256 = "0llffkjdz3x0yp3nvb1fa6041rj696xnkifvy6kalsbrxy8mbfn5";
    };

    LANG = "en_US.UTF-8";

    buildInputs = let
      mypkgs = import (fetchTarball "https://pkgs.kummerlaender.eu/nixexprs.tar.gz") { };
    in [
      pkgs.pandoc
      pkgs.highlight
      mypkgs.katex-wrapper
      mypkgs.make-xslt
    ];

    installPhase = ''
      cp -r ${content} source/00_content
      make-xslt
      mkdir $out
      cp -Lr target/99_result/* $out
    '';
  };
in {
  services.nginx.virtualHosts."tree.kummerlaender.eu" = {
    addSSL = true;
    enableACME = true;
    locations = {
      "/" = {
        root = "${result}";
      };
    };
  };
}
