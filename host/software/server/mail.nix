{ config, pkgs, ... }:

{
  imports = let
    release = "nixos-20.09";
  in [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz";
    })
  ];

  mailserver = {
    enable = true;
    fqdn = "mx.kummerlaender.eu";
    domains = [ "kummerlaender.eu" ];

    loginAccounts = import ./mailusers.nix;

    # Enable LetsEncrypt
    certificateScheme = 3;

    enableImap = true;
    enableImapSsl = true;
  };

  systemd.services.fetchmail = {
    enable = true;
    after  = [ "dovecot2.service" ];
    wantedBy = [ "dovecot2.service" ];
    serviceConfig = {
      User = "virtualMail";
      ExecStart = ''
        ${pkgs.fetchmail}/bin/fetchmail --fetchmailrc /var/vmail/fetchmailrc \
                                        --mda "${pkgs.dovecot}/libexec/dovecot/deliver -d adrian@kummerlaender.eu"
      '';
    };
  };
}
