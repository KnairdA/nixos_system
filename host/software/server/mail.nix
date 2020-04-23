{ config, pkgs, ... }:

{
  imports = [
    (builtins.fetchTarball "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/v2.3.0/nixos-mailserver-v2.3.0.tar.gz")
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
