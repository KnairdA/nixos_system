{ pkgs, ... }:

let
  content = pkgs.fetchgit {
    url    = "gitea@localhost:web/tree_content.git";
    rev    = "ed052cbb514b1d6bf7cdb34c1f23bca5690bbef3";
    sha256 = "1hzhgmrg5l8bpr2gqhf9ky4hia99lvjk2rrbj50n9a64s850bdcb";
  };

  result = pkgs.stdenv.mkDerivation {
    name = "tree.kummerlaender.eu";

    src = pkgs.fetchFromGitHub {
      owner  = "KnairdA";
      repo   = "tree.kummerlaender.eu";
      rev    = "6af4f31f1aa4546c9d09cbfa6f5840b73986a5c6";
      sha256 = "01f0n9rh8bnwnqyvh16rs6cn3niq8d7cp9g497j8cvm3654v4baf";
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
