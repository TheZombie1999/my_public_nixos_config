# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/680cb8cb-dc09-4011-b3c0-a2cdb18e408a";
      fsType = "ext4";
    };

  fileSystems."/home/steam" =
    { device = "/dev/disk/by-uuid/b86fa2e7-5ac5-45df-800d-9b9f0340d2e5";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B474-2554";
      fsType = "vfat";
    };

  fileSystems."/var/lib/anbox/rootfs" =
    { device = "/nix/store/qhfx6fp5qsvlnkqf76n2awi8b6ajsh0r-android_amd64.img";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/var/lib/anbox/combined-rootfs" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/anbox/combined-rootfs/cache" =
    { device = "/var/lib/anbox/cache";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/var/lib/anbox/combined-rootfs/data" =
    { device = "/var/lib/anbox/data";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9b117ce3-93d5-4c61-b20f-3e486553c448"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.anbox0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.tun0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}