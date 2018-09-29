{ pkgs, ... }:

{
  users.extraUsers.public = {
    isNormalUser = true;
    uid          = 2000;
    shell        = pkgs.fish;
    home         = "/home/public";
  };

  # `public` generates websites using their custom derivations via `nix-build`
  services.nginx.virtualHosts = let
    default = locations: {
      inherit locations;
      addSSL     = true;
      enableACME = true;
    };
    website = sub: default {
      "/".root = "/home/public/${sub}/result";
    };
  in {
    "kummerlaender.eu"        = website "overview";
    "blog.kummerlaender.eu"   = website "blog";
    "tree.kummerlaender.eu"   = website "tree";
    "static.kummerlaender.eu" = website "static";

    "pkgs.kummerlaender.eu" = default {
      "/".root                     = "/home/public/pkgs/result";
      "/nixexprs.tar.gz".proxyPass = "http://localhost:3000/adrian/pkgs/archive/master.tar.gz";
    };
  };
}
