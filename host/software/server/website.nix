{ pkgs, ... }:

{
  users.extraUsers.public = {
    isNormalUser = true;
    uid          = 2000;
    shell        = pkgs.fish;
  };

  services.nginx.user = "public";

  systemd.services.nginx.serviceConfig.ProtectHome = false;

  # `public` generates websites using their custom derivations via `nix-build`
  services.nginx.virtualHosts = let

    default = locations: {
      inherit locations;
      addSSL     = true;
      enableACME = true;
    };

    website = sub: default {
      "/".root = "/home/public/${sub}/result";
      "/".extraConfig = ''
        location ~* \.(?:html?|xml)$ {
          expires -1;
        }
      '';
    };

    proxy = server: target: {
      proxyPass = server;
      extraConfig = ''
        expires off;
        return ${target};
      '';
    };
  in {
    "kummerlaender.eu"        = website "overview";
    "blog.kummerlaender.eu"   = website "blog";
    "blip.kummerlaender.eu"   = website "blip";
    "tree.kummerlaender.eu"   = website "tree";
    "static.kummerlaender.eu" = website "static" // {
      extraConfig = ''
        add_header Access-Control-Allow-Origin *;
      '';
    };

    "literatelb.org"      = let
      sub = "literatelb";
    in default {
      "/".root = "/home/public/${sub}/result";
      "/".extraConfig = ''
        location ~* \.(?:html?|xml)$ {
          expires -1;
        }
        location /tangle/ {
          autoindex on;
        }
      '';
    };
  };
}
