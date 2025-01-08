{ ... }: {
  imports = [
    ./hardware-configuration.nix   
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = false;
  networking.hostName = "inf";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMYcdiZTkmjVhqK+IEDv6Q9bSSyc7LkWK3vyfsPkVMen
  ''];

  system.stateVersion = "23.11";
}
