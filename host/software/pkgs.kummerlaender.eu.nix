{ pkgs, ... }:

let
  content = pkgs.fetchgit {
    url    = "gitea@localhost:adrian/pkgs.git";
    rev    = "dc52ff2c3eada599e3f27a53f96ffa1af798932d";
    sha256 = "06znxiz5lwzkj479x3gwaa3g1c6jq4xqkjk2qajmfq9clzpkanrb";
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
      cp -r ${content}/web source/00_content
      make-xslt
      mkdir $out
      cp -Lr target/99_result/* $out
    '';
  };
in {
  services.nginx.virtualHosts."pkgs.kummerlaender.eu" = {
    addSSL = true;
    enableACME = true;
    locations = {
      "/" = {
        root = "${result}";
      };
      "/nixexprs.tar.gz" = {
        proxyPass = "http://localhost:3000/adrian/pkgs/archive/master.tar.gz";
      };
    };
  };
}
