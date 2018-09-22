{ pkgs, ... }:

{
  imports = [ ./hardware/automatix.nix ];

  boot.loader.grub = {
    enable  = true;
    version = 2;
    device  = "/dev/sda";
  };

  networking = {
    hostName = "automatix";

    firewall = {
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

  services = {
    gitea = {
      enable = true;
      database.type = "sqlite3";

      appName = "~/projects";
      domain  = "code.kummerlaender.eu";
      rootUrl = "https://code.kummerlaender.eu/";
      httpPort = 3000;

      extraConfig = ''
        [server]
        LANDING_PAGE = "explore"
        [service]
        DISABLE_REGISTRATION = true
        SHOW_REGISTRATION_BUTTON = false
        [api]
        ENABLE_SWAGGER_ENDPOINT = false
        [picture]
        DISABLE_GRAVATAR = true
        [other]
        SHOW_FOOTER_VERSION = false
        SHOW_FOOTER_TEMPLATE_LOAD_TIME = false
      '';
    };

    nginx = {
      enable = true;

      recommendedGzipSettings  = true;
      recommendedOptimisation  = true;
      recommendedProxySettings = true;
      recommendedTlsSettings   = true;

      virtualHosts."code.kummerlaender.eu" = {
        addSSL = true;
        enableACME = true;
        locations = {
          "/" = {
            proxyPass = "http://localhost:3000/";
          };
        };
      };
    };
  };
}
