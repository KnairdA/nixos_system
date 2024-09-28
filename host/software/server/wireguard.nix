{
  networking.firewall = {
    allowedUDPPorts = [ 54321 ];
  };

  networking.nat.enable = true;

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.1/24" ];

      listenPort = 54321;

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        { # atlas
          publicKey = "uuu0Ajabq6fkSdkw7SWLAt0cSYiXX0KWyj5amqVjqQw=";
          allowedIPs = [ "10.100.0.3" ];
        }
        { # athena
          publicKey = "eweByJZDVxq23kJjGV5e1utRdPKo4erEnwwe13bFrkE=";
          allowedIPs = [ "10.100.0.4" ];
        }
        { # mobiltelefon
          publicKey = "4tG2tdM9h/wbxjeFPF7ccLfZ9UghhrAhc/qoqGeL+Sw=";
          allowedIPs = [ "10.100.0.6" ];
        }
        { # hephaestus
          publicKey = "0nd/5vZaerTCUpS6uXsulCTzI3ZsUT2N2pnh7zTo8wg=";
          allowedIPs = [ "10.100.0.7" ];
        }
        { # idefix
          publicKey = "4Q1Glnceec8FOtkq8UnaYtlwsR1VIvs6lTalavNQp0A=";
          allowedIPs = [ "10.100.0.8" ];
        }
      ];
    };
  };
}
