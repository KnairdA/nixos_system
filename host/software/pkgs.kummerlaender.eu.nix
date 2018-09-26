{ pkgs, ... }:

let
  content = pkgs.fetchgit {
    url    = "gitea@localhost:adrian/pkgs.git";
    rev    = "9e1c4583fd06953db2b2eddf6e183f882b64bd2e";
    sha256 = "0zykfg8z2gmaz3si9n8zhsx7zdxnqn81zg1nr01gi42g85i65zq8";
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
