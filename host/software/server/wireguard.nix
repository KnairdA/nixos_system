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
          publicKey = "Tkoaewh9HB5rIuJVrFgClRF4x7prOtIlSJjiTYCpxis=";
          allowedIPs = [ "10.100.0.3" ];
        }
        { # athena
          publicKey = "t4SzRV/olVdzAKauJOwFau3I0fTISUvbOAaKGZd6ezU=";
          allowedIPs = [ "10.100.0.4" ];
        }
      ];
    };
  };
}
