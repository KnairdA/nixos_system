{ pkgs, ... }:

let
  result = import (pkgs.fetchFromGitHub {
    owner = "KnairdA";
    repo  = "blog_content";
    rev    = "c467ca2df2759a00edc4b15f81097299771fcd5c";
    sha256 = "0kinmswnklpvmkaaks7x9gj8yk217299d9rc4ca7kdklmi4xsfrw";
  }) { };
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
