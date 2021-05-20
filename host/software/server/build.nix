{
  nix.buildMachines = [ {
    hostName = "majestix";
    sshUser = "common";
    system = "x86_64-linux";
    maxJobs = 16;
    speedFactor = 2;
  } ];

  nix = {
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
