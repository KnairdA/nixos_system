{ pkgs, ... }:

{
  services.openvpn.servers = {
    KIT = {
      autoStart = false;
      config = let
        path = pkgs.fetchurl {
          url = "https://www.scc.kit.edu/scc/net/openvpn/conf/kit-split.ovpn";
          hash = "sha256-j4pCKyU7t1ZmwIGm5kuUgZ26Qiqa1jzoDZcP2x+A9pM=";
        };
      in "config ${path}";
    };

    KIT-full = {
      autoStart = false;
      config = let
        path = pkgs.fetchurl {
          url = "https://www.scc.kit.edu/scc/net/openvpn/conf/kit.ovpn";
          hash = "sha256-G1vnDu+nQ70X3JtQCojmfSJiXkkItyuXnzxdwlKA9Ks=";
        };
      in "config ${path}";
    };
  };
}
