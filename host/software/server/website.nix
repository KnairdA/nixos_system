{ pkgs, ... }:

{
  users.extraUsers.public = {
    isNormalUser = true;
    uid          = 2000;
    shell        = pkgs.fish;
  };

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

    proxy = target: {
      proxyPass  = target;
      extraConfig = ''
        expires off;
        proxy_set_header Host code.kummerlaender.eu;
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

    "pkgs.kummerlaender.eu" = default {
      "/".root = "/home/public/pkgs/result";
      "/nixexprs.tar.gz"  = proxy "http://code.kummerlaender.eu/pkgs/snapshot/master.tar.gz";
      "/nixexprs.tar.xz"  = proxy "http://code.kummerlaender.eu/pkgs/snapshot/master.tar.xz";
      "/nixexprs.tar.bz2" = proxy "http://code.kummerlaender.eu/pkgs/snapshot/master.tar.bz2";
    };

    "literatelb.org"      = website "literatelb";
  };
}
