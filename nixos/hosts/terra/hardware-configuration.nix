# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" "nvidia"  ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  time.hardwareClockInLocalTime = true;
  hardware.opentabletdriver.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b385deb9-aeba-4c7b-af58-1d85065f374c";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-f2fd6953-e6af-471b-b1a3-a5d6535c76dd".device = "/dev/disk/by-uuid/f2fd6953-e6af-471b-b1a3-a5d6535c76dd";
  boot.initrd.luks.devices."luks-817482c0-d08c-46c5-a991-12147d69a863".device = "/dev/disk/by-uuid/817482c0-d08c-46c5-a991-12147d69a863";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9A26-D23F";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f7a2f4e4-14b7-42d0-95b7-783b6c90ba21"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  }; 
   
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia = { 
    modesetting.enable = true;
    open = false;
    powerManagement.enable = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  }; 
  
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];

  virtualisation.docker.enableNvidia = true;

  services.asusd.enable = true;
  services.asusd.enableUserService = true;

  # Need to check if this works
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{power/wakeup}="disabled"
  '';

}
