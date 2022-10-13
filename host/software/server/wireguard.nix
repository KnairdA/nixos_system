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
        { # obelix
          publicKey = "RrsNZKZ17Ol1WHxZesLnenGKnqxiQlE0T8xFP6/5mBE=";
          allowedIPs = [ "10.100.0.2" ];
        }
        { # majestix
          publicKey = "SM8UGi+7MuS4aKBi5tPqykdHswlEJvLnYSLMjWg5eCQ=";
          allowedIPs = [ "10.100.0.3" ];
        }
        { # athena
          publicKey = "eweByJZDVxq23kJjGV5e1utRdPKo4erEnwwe13bFrkE=";
          allowedIPs = [ "10.100.0.4" ];
        }
        { # schreibfix
          publicKey = "WBvUFZ4mgTi6O8BB6L4snRKMWHcy5QiROdEFCwYbbUo=";
          allowedIPs = [ "10.100.0.5" ];
        }
        { # mobiltelefon
          publicKey = "jUtbAF3TZDEFXlL+YTV3g26wP0IWGbpiCFGXjxo5TXE=";
          allowedIPs = [ "10.100.0.6" ];
        }
        { # hephaestus
          publicKey = "0nd/5vZaerTCUpS6uXsulCTzI3ZsUT2N2pnh7zTo8wg=";
          allowedIPs = [ "10.100.0.7" ];
        }
        { # idefix
          publicKey = "sF89wadXLEMXeNHNFPas7umP/QeyXMs3s7XGfXmY2lc=";
          allowedIPs = [ "10.100.0.8" ];
        }
      ];
    };
  };
}
