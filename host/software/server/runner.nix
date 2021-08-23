{ config, pkgs, ... }:

{
 services.gitlab-runner = {
    enable = true;
    services = {
      olbtest = {
        executor = "shell";
        registrationConfigFile = "/etc/gitlab-runner.conf";
        tagList = [ "nixos" ];
      }; 
    };
  };

  users.users.gitlab-runner = {
    isNormalUser = true;
    shell = pkgs.fish;
  };

  nix.allowedUsers = [ "gitlab-runner" ];
}
