{ pkgs, ... }:

{
  users.extraUsers.common = {
    isNormalUser = true;
    uid          = 1000;
    extraGroups  = [ "wheel" ];

    shell        = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUbB/Hni3byPt/hhUf+epDMSd4kXtc2lPQNdcfVFf4QWsZraY27BOz1HQAOJ80/ZwKxuPtOp9tzY6ma6C+9KjjMN0yWHK/6J+uqVYqK08rIKXzO0FrKIPnTQpsLKVznOm1df/Pjyq0aUCPwnLOHKwz6HyrIbe0CotKUBthjrDpOJx+dxh0aePx67S6uxcnRy8y1cmWVmL9Yu1vvg/mtjQzbbT7QjCysZyGoFCswD4BFWuhr8mlcO533UD6VYgQ2RMXNRnQT1qx0aXqHmCMy3BYirsRFpFUaEC+KTG2lf8SzKGYZBj4c7oHHZ2MkiasleOV9hddEJcshbneDgvCl8WP common@automatix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMhfKkkNTyP+Bnmv775FN0CbhQAGbhr6i2qEZehttybvjoYgkq7YrLVEcAT99vfeadKwysX7erygitFr+QnpHo4OX/2Tc5A5m3y8g5TdRCmGZLKQLbcCetItaOT/tbdvm0pD2dMzEVqNDU/NRJ6cIovSvIoUxOoEZaV1xXFm1ZXwwcxbVHN+twBbzJ52JgE+UoLnTsTaqKMHIHsd2P3ESJ4Y9U2r+1n61pZ4q5l3AfQLwi1uM2c1VdhG6+zAtGikAulr8lTCRQIvawOTbC2f85Y7hwpwAIJR/HlG1Xf03ir5d+txJmnEj5dqpy8LLlRTUW+bSfEWTcLun/nZ/DH99wGdtsfsaVBdZ1QIisBPPw10+rPFAqcTSPtrwuT10ZThznumABbxrMvj6g/NrkscgrmwBd360mvEhDHHjr+emaxTWnXYS7Z047ogYVCkciWOeQqgOl1iEkE690r7lCo0VvkuOfBmDseFY72FnZXhijjfu3ZmDtCbELw3aFrVeVC8M= mobiltelefon"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAzzWbHZZ9wXg87iuqe+d/4UXVHa7IvqQvuBdNx7zuOfILgLURuJ3snsXEpcz3nDa9+PBnMSBQo8n96W4yzwTzHU0Pfvf69mY/ZqBNy/4hjM9LDsO/jJn815txcOHchj22/4jLCj5GVMrcxCpcgeLKCbfSy3WtC52P5WkUDikuiLOkFWLzJX28paE846zEaMqmmxgSB15p1ArvCLav2oyVnFBDDvpQNOljln3Mqqe5zF3rW9R7OBHyQlXB4nD2fQYBTDb2bzLOqnfKtTBZWGs55idgGS2Fi8kx1yfWoGkEWi7qadQFct3MZucLsle+OHj2m0taVOWY6c8OvTNLAIsXoBV7Dxh89MJG8764EzDWCU+RYo0LapU5bXQ3AYDuTmAfC6Tg4R9CKKIA4NvCS1oXFvG0wE9XDeFZwE7EiTceQ9G1x6cC38ZcXs5oLoGHziEv+2Xe9MlmvVfc/52URk0i5ONout+GirGhx63D/Kyi/x7PcmSbijyhJaY48nCO4s0= common@hephaestus"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+Nfzp2M4QaTyWa8H1T3YvajH57pMJfzvDO2Meyu3fZAXNVfBCTVG1Bf/bFd81Htj4L750ORUhivgWFW/1DZKNYpqD4wDWVPg+WAGlIA28+QWoUaKnZV9u/6YKOrF801HMKbkusoaEJrnzwo4ktxgeXuDKEoly5IQ80wtd4ItE83wCMBIdUdKXaypDhbyNGMIJYC7V9qNWOhoYWKrF/fo9IIQYVU+RexYClPgqXChEMa9gKC48yJ+ExaEwFlortR3H+tfcG4Os19YKmTTlbMn/DIHcF3j9G/G73sycPomVESgRhEYIPAHHGV9TKFLjDWrendrhxtIcjWUtUomMZo4f31Fdgo9qKWd5AyIcqn2lNz4gKcXplZjsTrhl8wMcywrsOD3OEhP3/wmz/0ad48OHafW0eETHjLgNu3LbhrmihXf2rjgQiQESbJ75hUzS2J5R/3ub8+QdHY94XCwAFdp/+x/X3gdsQoQ2k1uEp6i/7ESTgSFfIyyRlwRS62C13aE= common@athena"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4usSgXZDPbPij4ZzLxWgMKveHhXMZAabQw2eAQCVIvj7oNEpuH5rn4qmMmfuNrbfzjZHnd2JKIDnS4RSNI3sX52xgp7dZ9L3rxce3lc18o32oIP21uVPGr7tFI1jVYrcVVzWBel+IKm9AijAV9TFGyWu0Rvm/CO9F2h0+5GlPclusjdj9mk+WovRGlfVZ0MYGKOUenIeW9a21N1PCgRZhCQ0pm5XmY/RK4i79BStWCtcpfcGCMwagGd8FMU/yqUGobxRevZ3E45SSZCL+LCvqTZNWkDMWiPTkKtVHh2W09ivMSpTne5s2UfmP6wUYQQ1NFAgEke9Fufh3qvf9OQqwee2Ko9NaixRb7jtqsyZmhUPHSEINKQT11smBNzvXNYODw4hA4PdzonqOtAQnCNUwJ7fAmqMZUehWjejMIJ0aL9keWO7cUWS7aVEYjav39rbmm1CCfJ0iTmsZmB3wUuVt9Y26SNwtiGSYxjbDqvD6LKnzzm/7ZwTZUa5FNda1kqs= common@idefix"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD3h1hYcm4uQssu3bKdPbP5HI/QbHbblWYX2w/Lx1sv6CLgIYkE2Ah9GExK685HFPJd13ISdKI/ZGpqHw9ewZDG8JtHh6/ijE13VOPTOAZf6FcAfsbqGs8TVqsQ2HKGaqfIUZTmUCFkUuIPUm8vdmOVs/3jt1h9nA860qHuB2ET7hmof9QiPSx5uw0uHadda9cqA2FMuS+J8iaFcrO2Dxtj8NrvT4/a1Yz0D6lKD8isL7hEpgqxmokgBULGXWPCbH/dOsGtqWbhqlU4x5kdzAB2lFcT5dqOlBKgBoMH80iVq2pcUn/vMVtuWPO7cr1vPFD/J+0XOy0ZSN0lC3wurPRwnE6N7V6kkzXfmpw4R0Y6bHk/25wSDbEk/gjTejM0HY9I+/EF57pUpga7oZ9844xdEQHrYJ4fQ5nslJ/MzHDYmpbL7U+aOaZz2/siq8cdZ9N45ZNuVPZyplQgMi40kJRtN/is2Ar1cdJjE7mZgVBPn+dUzQguhOUTq4Uno1bmw7k= common@atlas"
    ];
  };
}
