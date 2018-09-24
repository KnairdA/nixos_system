{ pkgs, ... }:

let
  content = pkgs.stdenv.mkDerivation {
    name = "blog.kummerlaender.eu";

    src = pkgs.fetchFromGitHub {
      owner = "KnairdA";
      repo  = "blog.kummerlaender.eu";
      rev   = "218123bcc40a82ec10bf4f1de372f72557aa0064";
      sha256 = "1yhpvc0z7v5crvmyszzp9jcf23fd0pri6mrvn3k3bbycndmbs4gx";
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
        root = "${content}";
      };
    };
  };
}
