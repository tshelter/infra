{ modulesPath, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "xen_blkfront" "vmw_pvscsi" ];
  boot.initrd.kernelModules = [ "nvme" ];
  fileSystems."/" = { device = "/dev/sda1"; fsType = "ext4"; };
  swapDevices = [ { device = "/dev/sda5"; } ];

  networking.interfaces.ens18.ipv4.addresses = [{
    address = "192.168.100.69";
    prefixLength = 24;
  }];
  networking.defaultGateway = {
    address = "192.168.100.1";
    interface = "ens18";
  };
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
}
