{ pkgs, ... }:

{
  services.uwsgi = {
    enable = true;
    user  = "public";
    group = "users";
    plugins = [ "cgi" ];

    instance = {
      type = "emperor";
      vassals = {
        cgit = {
          type = "normal";
          master = "true";
          socket = "/run/uwsgi/cgit.sock";
          procname-master = "uwsgi cgit";
          plugins = [ "cgi" ];
          cgi = "${pkgs.cgit}/cgit/cgit.cgi";
        };
      };
    };
  };

  services.gitolite = {
    enable = true;
    user  = "git";
    group = "git";
    adminPubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy2h3NXWVW7BlEehCCgQ3ZMq64rqxoI70dg9Zq3SdIWcqunkWsHGSmzXbxM0ZCD2/VWNVrvShusg0dDSOwV64HUxIuDWpM6gCvg5MKBS0ZMwb9831d0ybf6kU/gppJGyM7R9HspB69C9pnKBB6vUUXd/TgmjhiAHPCwbq/vgWRN7yYGwB/tc7pRiugk6tyfgvXvFCnQXZLoPSx0qBF3L6YyRzbtL5sI7KoN/gCzgqnT0H91vhxkjXrPN+GnW43lcbaqApd3gd0NmMaWNxR6ZKnXFFcUPI72cbBmhe3+t15pF9ZUYZ0sKSfbgOZx0vHLiS69Dr63L6gVNGNx7B/yxC3 common@asterix";
    extraGitoliteRc = ''
      $RC{UMASK} = 0027;
      $RC{GIT_CONFIG_KEYS} = '.*';
    '';
  };

  users.extraUsers.public.extraGroups = [ "git" ];

  services.nginx.virtualHosts."code.kummerlaender.eu" = {
    addSSL     = true;
    enableACME = true;
    root = "${pkgs.cgit}/cgit";
    locations = {
      "/" = {
        extraConfig = ''
          try_files $uri @cgit;
        '';
      };
      "@cgit" = {
        extraConfig = ''
          uwsgi_pass unix:/run/uwsgi/cgit.sock;
          include ${pkgs.nginx}/conf/uwsgi_params;
          uwsgi_modifier1 9;
        '';
      };
    }; 
  };

  systemd.services.create-cgit-cache = {
    description = "Create cache directory for cgit";
    enable = true;
    wantedBy = [ "uwsgi.service" ];
    serviceConfig = {
      type = "oneshot";
    };
    script = ''
      mkdir /run/cgit
      chown -R public:users /run/cgit
    '';
  };

  environment.etc."cgitrc".text = ''
    virtual-root=/

    cache-size=1000
    cache-root=/run/cgit

    root-title=~/projects
    root-desc=code.kummerlaender.eu
    footer=

    enable-index-owner=0
    enable-http-clone=1
    noplainemail=1

    max-atom-items=50

    enable-git-config=1
    enable-gitweb-owner=1
    remove-suffix=1

    snapshots=all
    readme=master:README.md

    source-filter=${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py
    about-filter=${pkgs.cgit}/lib/cgit/filters/about-formatting.sh

    project-list=/var/lib/gitolite/projects.list
    scan-path=/var/lib/gitolite/repositories
  '';
}
