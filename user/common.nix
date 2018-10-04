{ pkgs, ... }:

{
  users.extraUsers.common = {
    isNormalUser = true;
    uid          = 1000;
    extraGroups  = [ "wheel" ];
    shell        = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCdvxfprSTiMGKeH3GvG9/gupBM0urKTrliK2wzrgcHgNyWiaGFveRpX4cMPdi8uhfDrwGmKLYJfAfjsmmpmY8DTDpkeXT2vdS7q0YtoYCgjztXum0Fxd4khR3Z4Pwh6BEpxBgzIE94T749wuvW2gZLyHGPyZH5w3EXr4TBh4YSwUwVYGrPaGDVbsJ/8lEpqPu5T4S1CzaaLh0mfuyIJfo0EfU8TWmA028qVfz+6jT3/CZrv0Ru/HYEo6mAY35Im3pGTug7GWLI45tbaI++jJCo7dK+rs3uPyccHxLHnUwPtxj4wVGBbcVy8S5LyJpm2lFHQO4eu4QHiFgBA2GeXCF common@obelix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy2h3NXWVW7BlEehCCgQ3ZMq64rqxoI70dg9Zq3SdIWcqunkWsHGSmzXbxM0ZCD2/VWNVrvShusg0dDSOwV64HUxIuDWpM6gCvg5MKBS0ZMwb9831d0ybf6kU/gppJGyM7R9HspB69C9pnKBB6vUUXd/TgmjhiAHPCwbq/vgWRN7yYGwB/tc7pRiugk6tyfgvXvFCnQXZLoPSx0qBF3L6YyRzbtL5sI7KoN/gCzgqnT0H91vhxkjXrPN+GnW43lcbaqApd3gd0NmMaWNxR6ZKnXFFcUPI72cbBmhe3+t15pF9ZUYZ0sKSfbgOZx0vHLiS69Dr63L6gVNGNx7B/yxC3 common@asterix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKzc+VocgNSTXa64vwYeydjhKJRWMMZcQ1tmDv/uWbAhB9lDwS1b5R868u0gHbpRCfR6xFBFM0IYxS61RZktH0Cc0d3TU4xxX0oa84LN70LsQut/WiT38zTEWCltz+2+RgS1TuDTqhnp/S7fHc8Bm8oNsI8f25K9EqEADVtxzjxhiz7US6U6GbhoSx2/3hDUp4IgZU/MsDVCqQ0T1SMJIZS8vM2EUpeVZNhIuYJ06Ncy8MAgG1sEacXd+rb96Yltd7+y9QK+5aIYYs4Sx3Y6rXKmUj/mLWIroFY4jSk3Mw81+60px+qDhwY4kJv1Ttfs14awaZ5JRHO5fDPhwfrcTt common@Schreibfix"
    ];
  };
}
