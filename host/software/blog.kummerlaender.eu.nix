{ pkgs, ... }:

let
  result = pkgs.stdenv.mkDerivation {
    name = "blog.kummerlaender.eu";

    src = pkgs.fetchFromGitHub {
      owner = "KnairdA";
      repo  = "blog.kummerlaender.eu";
      fetchSubmodules = true;
      rev    = "92beb2254a441d43bb66ab89a179853ccbe6bceb";
      sha256 = "1mbxjkh8wxsvqb3yc6cirr3rady756vvys3v5l8k2rxkkl90wg1m";
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

    patches = [ ./asset/blog.kummerlaender.eu-change-domain.patch ];

    installPhase = ''
      make-xslt
      mkdir $out
      cp -Lr target/99_result/* $out
    '';
  };
in {
  services.nginx.virtualHosts."blog.kummerlaender.eu" = {
    addSSL = true;
    enableACME = true;
    locations = {
      "/" = {
        root = "${result}";
      };
    };
  };
}
