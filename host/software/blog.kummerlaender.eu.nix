{ pkgs, ... }:

let
  mypkgs = import <mypkgs> { };

  content = pkgs.stdenv.mkDerivation {
    name = "blog.kummerlaender.eu";

    src = pkgs.fetchFromGitHub {
      owner = "KnairdA";
      repo  = "blog.kummerlaender.eu";
      rev   = "218123bcc40a82ec10bf4f1de372f72557aa0064";
      sha256 = "1yhpvc0z7v5crvmyszzp9jcf23fd0pri6mrvn3k3bbycndmbs4gx";
    };

    LANG = "en_US.UTF-8";

    buildInputs = [
      pkgs.pandoc
      pkgs.highlight
      mypkgs.KaTeX
      mypkgs.makeweb
    ];

    patches = [ ./asset/blog.kummerlaender.eu-change-domain.patch ];

    installPhase = ''
      makeweb
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
