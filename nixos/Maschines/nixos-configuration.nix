# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, home-manager, nixpkgs,... }:
{

  imports =
    [ 
      home-manager.nixosModule
      ./Modules/autoStart.nix
      ./Modules/autoUpgrade.nix
      ./Hardware/nixos-hardware-configuration.nix
      ./common-configuration.nix
      ./../Network/default.nix
      ./../Network/UniVpn/univpn.nix
      ./../Network/ip-nixos.nix
    ];

  hardware.keyboard.zsa.enable = true;
  
  MyHardware.AutoUpdate = true;
  
  programs.ssh.startAgent = true;
  programs.ssh.forwardX11 = true;

  programs.xwayland.enable = true;
    
  # virtualisation.libvirtd.enableKVM = true;  
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # environment.systemPackages = with pkgs; [ virt-manager kvm qemu libvirt ];
  
 #  boot.extraModprobeConfig =''
	# options vfio-pci ids=8086:4680
 #  '';  
  boot.extraModprobeConfig =''
	  options vfio-pci ids=1002:73bf,1002:ab28,1002:1479,1002:1478
  '';  
	# options kvm ignore_msrs=1
	# options kvm report_ignored_msrs=0
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
  '';  

  users.users."tim".extraGroups = [ "libvirtd" "scanner" "lp" "audio"]; 
  users.users."steam".extraGroups = [ "libvirtd" ];  
  users.users."root".extraGroups = [ "libvirtd" ];  

  # Virtual Box Not Working ...
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "tim" "steam" ];
  # nixpkgs.config.allowUnfree = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;


  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    configurationLimit = 10;
  };
  
  services.openssh = {
    enable = true;
    settings = {
      passwordAuthentication = true;
      kbdInteractiveAuthentication = true;
    };
    openFirewall = true;
    forwardX11 = true;
  };

  users.users."tim".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFJSqgVY473W2pDRP0FTpXRboFNc3tWJXCZnNG0idmBs tim"
  ];
  
  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "tim" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.openFirewall = true;
  services.printing.drivers = [ pkgs.hplip ];
  
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];  # Enable touchpad support (enabled default in most desktopManager).

  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.tim = {
    # isNormalUser = true;
    # extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # List packages installed in system profile. To search, run:
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    # ( import ./../Scripts/test.nix ) 
    ( import ./../Scripts/mount_sshfs_uni.nix )
    ( import ./../Scripts/up_microstar.nix )
    ( import ./../Scripts/launch_polybar.nix )
    citations
    texlab
    fswatch
    pulsemixer
    # vim 
    # neovim
    # wget
    # helix
    git
    sshfs
    networkmanager-openvpn
    discord
    libnotify
    gnupg 
    xclip
    chromium 
    tdrop
    # vifm
    clipmenu
    # neofetch
    # powerline
    # powerline-go
    jq
    ack
    # nodejs
    warpd
    corectrl
    # SDL2
    # glew
    virt-manager 
    qemu 
    libvirt  
    OVMF
    qemu_kvm
    android-tools
    spice
    spice-vdagent
    wally-cli
    xorg.xf86videointel
    simple-scan
    aspell
    aspellDicts.de
    tabbed
  ];
  
  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
  programs.corectrl.gpuOverclock.enable = true;
  
  # virtualisation.anbox.enable = true;
  
  
  
  fonts.fonts = with pkgs; [
    nerdfonts
    powerline-fonts
    julia-mono
  ];
  

  services.xserver = {
    enable = true;
    
    displayManager.lightdm.extraSeatDefaults = ''
      autologin-user=tim
      autologin-user-timeout=0      
    '';
    
    desktopManager = {
      xterm.enable = false;
      plasma5.enable = true;
      plasma5.excludePackages = with pkgs.libsForQt5; 
        [ 
          elisa
          gwenview
          okular
          oxygen
          khelpcenter
          konsole
          plasma-browser-integration
          print-manager        
        ];
    };
    
    displayManager.defaultSession = "none+i3";
    
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
    
    xrandrHeads = [
      {
        output = "HDMI-A-0";
        primary = true;
      }
      {
        output = "DisplayPort-1";
      }
    ];
  };
  
  services.picom = {
    enable = false;
    fade = true;
    shadow = false;
    fadeDelta = 10;
  };
  
  # To run notify-send do this
  # export DBUS_SESSION_BUS_ADDRESS
  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [
  #     " 15 16 * * * root cd /etc/nixos && eval $(ssh-agent -s) && ssh-add /home/tim/.ssh/github-key && git pull -q origin master &> /home/out.log"
  #   ];
  # };
  nixpkgs.config.allowBroken = true;  
  
  services.xserver.enableCtrlAltBackspace = true;
  system.stateVersion = "22.05";
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  
  
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  # For 32 bit applications 
  # Only available on unstable
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];  

  programs.noisetorch.enable = true;

  environment.etc."polybar/config.ini".source = ./../Software/polybar/config.ini;
}

