{ pkgs, ... }:

{
  users.extraUsers.common = {
    isNormalUser = true;
    uid          = 1000;
    extraGroups  = [ "wheel" ];
    shell        = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy2h3NXWVW7BlEehCCgQ3ZMq64rqxoI70dg9Zq3SdIWcqunkWsHGSmzXbxM0ZCD2/VWNVrvShusg0dDSOwV64HUxIuDWpM6gCvg5MKBS0ZMwb9831d0ybf6kU/gppJGyM7R9HspB69C9pnKBB6vUUXd/TgmjhiAHPCwbq/vgWRN7yYGwB/tc7pRiugk6tyfgvXvFCnQXZLoPSx0qBF3L6YyRzbtL5sI7KoN/gCzgqnT0H91vhxkjXrPN+GnW43lcbaqApd3gd0NmMaWNxR6ZKnXFFcUPI72cbBmhe3+t15pF9ZUYZ0sKSfbgOZx0vHLiS69Dr63L6gVNGNx7B/yxC3 common@asterix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCdvxfprSTiMGKeH3GvG9/gupBM0urKTrliK2wzrgcHgNyWiaGFveRpX4cMPdi8uhfDrwGmKLYJfAfjsmmpmY8DTDpkeXT2vdS7q0YtoYCgjztXum0Fxd4khR3Z4Pwh6BEpxBgzIE94T749wuvW2gZLyHGPyZH5w3EXr4TBh4YSwUwVYGrPaGDVbsJ/8lEpqPu5T4S1CzaaLh0mfuyIJfo0EfU8TWmA028qVfz+6jT3/CZrv0Ru/HYEo6mAY35Im3pGTug7GWLI45tbaI++jJCo7dK+rs3uPyccHxLHnUwPtxj4wVGBbcVy8S5LyJpm2lFHQO4eu4QHiFgBA2GeXCF common@obelix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg5H5dtZwtKltCjCbQ2wDsMMNb3X7wcpiPpH+QBIdhMcDeyiEy5HoD6yVKppIJA9KQKr7VjzCF0eV/PgBVyoKZGGPSfB1B1Diys6MYCBSgfYh7iqxzyzdOl4/NTGsHEN6iH9e86QBge5VcUaIf/2H/g4F+5/mekR3h6aDqkS596pk3PzSiuWIZN1OCaTILG0QakQ24oevlHloasG2oWdR+Bfjp3kFvDbX5yVPPSBCLwCnyZPWse+MYAD+HAw70pve7InO35s/VyodC8RODiHZ6sQAK+o1Y9g1UDE1aTXhXWBNt1wQVIlYd9+Bf4lWuB0FA5kUfXd4Li5O4RWW3fsKT common@Schreibfix"
    ];
  };
}
