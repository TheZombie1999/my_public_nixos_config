# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ 
    "xhci_pci" 
    "ahci" 
    "nvme" 
    "usbhid" 
    "usb_storage" 
    "sd_mod" 
    # PCI Passthrough
         
  ];
  
  
  
  
  # For 32 bit applications 
  # Only available on unstable
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];  
  
  boot.initrd.kernelModules = [ "amdgpu" ];

  # boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.initrd.kernelModules = [ "modesetting" ];
  boot.kernelModules = [ "kvm-intel" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
  # boot.extraModulePackages = [ 
    # pkgs.linuxKernel.packages.linux_6_0.vendor-reset
  # ];
  
  # boot.kernelParams = [ "i915.enalbe_guc=2" ];
  # boot.kernelParams = [ "i915.force_probe=GT1" "intel_iommu=on"];
  boot.kernelParams = [ "i915.force_probe=GT1" "intel_iommu=on" "iommu=pt"];

  # boot.kernelPackages = pkgs.linuxPackages_xanmod;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_0;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen.vendor-reset;
  
  
 environment.systemPackages = [
  ];  
  
  hardware.opengl.extraPackages = with pkgs; [
    # rocm-opencl-icd
    # rocm-opencl-runtime
    # rocm-runtime
    amdvlk
    # rocm-device-libs
    # intel-compute-runtime
    # intel-media-driver # LIBVA_DRIVER_NAME=iHD
    # vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    # vaapiVdpau
    # libvdpau-va-gl
  ];
  
  # hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiIntel ];

  
  # systemd.tmpfiles.rules = [
  #     "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.hip}"
  #   ];  

   users.users.tim.packages = with pkgs;
  [
    vulkan-tools
    lutris
  ]; 
  
 hardware.opengl.driSupport32Bit = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.enable = true;
  hardware.pulseaudio.support32Bit = true;  
  
  services.xserver.videoDrivers = [ "amdgpu" ];
  # services.xserver.videoDrivers = [ "intel" ];
  # services.xserver.videoDrivers = [ "amdgpu" ];
  # services.xserver.useGlamor = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/680cb8cb-dc09-4011-b3c0-a2cdb18e408a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B474-2554";
      fsType = "vfat";
    };
  
  fileSystems."/home/steam" = {
    device = "/dev/sda1";
    options = ["nofail" "users" "exec" "group" "rw" "grpid"  ]; # Find these Options undter man mount 8
    # options = ["defaults" "user" "rw" "utf8" "noauto" "umask=000"];
    # options = ["nosuid" "nodev" "nofail" "x-gvfs-show"];
    fsType = "ext4";
  };

  # fileSystems."/mnt/Samsung/Win" = {
  #   device = "/dev/sda3";
  #   options = ["nofail"];
  # };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9b117ce3-93d5-4c61-b20f-3e486553c448"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  
  # services.xserver.deviceSection = ''
  #   Option "DRI" "2"
  #   Option "TearFree" "true"
  # '';  
  
  services.xserver.exportConfiguration = true;
}