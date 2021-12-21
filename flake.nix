{
  description = "System environment of Adrian Kummerlaender";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
    pkgs-personal.url = github:KnairdA/pkgs/master;
  };

  outputs = { self, nixpkgs, pkgs-personal, ... }: let
    config = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit pkgs-personal;
        inherit hostname;
      };
      modules = [ ./configuration.nix ];
    };

    hostnames = builtins.map
      (h: builtins.replaceStrings [ ".nix" ] [ "" ] h)
      (builtins.filter
        (h: h != "")
        (nixpkgs.lib.mapAttrsToList
          (name: type: if type == "regular" then name else "")
          (builtins.readDir ./host)));

  in {
    nixosConfigurations = builtins.listToAttrs
      (map (h: { name = h; value = config h; }) hostnames);
  };
}
