{ pkgs, ... }:

{
  services.nginx.virtualHosts."pkgs.kummerlaender.eu" = {
    addSSL = true;
    enableACME = true;
    locations = {
      "/nixexprs.tar.gz" = {
        proxyPass = "http://localhost:3000/adrian/pkgs/archive/master.tar.gz";
      };
    };
  };
}
