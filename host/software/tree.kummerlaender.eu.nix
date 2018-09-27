{ pkgs, ... }:

let
  result = import (pkgs.fetchgit {
    url    = "gitea@localhost:web/tree_content.git";
    rev    = "72ebbabe1466d2e7ec3f7b6035bf78dc88bdc35a";
    sha256 = "0dqlqrz8wlgqkrqsn0fk861j81msrprmh7k1q733smgrykmr2v09";
  }) { };
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
