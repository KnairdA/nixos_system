{ pkgs, ... }:

{
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
        [other]
        SHOW_FOOTER_VERSION = false
        SHOW_FOOTER_TEMPLATE_LOAD_TIME = false
        [api]
        ENABLE_SWAGGER_ENDPOINT = false
        [picture]
        DISABLE_GRAVATAR = true
        [indexer]
        REPO_INDEXER_ENABLED = true
      '';
    };

    nginx.virtualHosts."code.kummerlaender.eu" = {
      addSSL = true;
      enableACME = true;
      locations = {
        "/" = {
          proxyPass = "http://localhost:3000/";
        };
      };
    };
  };
}
