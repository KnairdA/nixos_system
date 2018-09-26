{ pkgs, ... }:

let
  content = pkgs.fetchgit {
    url    = "gitea@localhost:web/tree_content.git";
    rev    =  "bc3ac4828b8980dd83963f2cf2c4df8f10a8f96a";
    sha256 = "0f7mgm8z714k34dc7v7iv5i6dmgmk4dyawbyx7y7p8cbjcg1bdw4";
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
