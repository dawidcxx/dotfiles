# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  networking.hosts = {
    "116.203.242.56" = ["buntu"];
  };

  programs.noisetorch.enable = true;
  programs.dconf.enable = true;


  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
       "nowatchdog"
       "quiet"
  ]; 


#  environment.etc = {
#    "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
#      context.properties = {
#	default.clock.rate = 48000
#	default.clock.quantum = 32
#	default.clock.min-quantum = 32
#	default.clock.max-quantum = 32
#     }
#    '';
#  };


 # boot.initrd.luks.devices."luks-817482c0-d08c-46c5-a991-12147d69a863".device = "/dev/disk/by-uuid/817482c0-d08c-46c5-a991-12147d69a863";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "208.67.222.222" ];

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

#  xdg.portal.enable = true;
#  services.flatpak.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "pl";
    inputClassSections = [
      ''
        MatchIsPointer            "on"
        Identifier                "Disable3ButtonEmulation"
        Option "Emulate3Buttons"  "False"
      ''
    ];
  };

  

  sound.enable = true;
  hardware.pulseaudio.enable = false;


  hardware.logitech = {
    wireless = {
      enable = true;
    }; 
  };

  security.rtkit.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;
  security.tpm2.tctiEnvironment.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "terra";
    dataDir = "/home/terra/Documents";
  };

  security.pam.services.terra.enableGnomeKeyring = true;

  users.users.terra = {
    isNormalUser = true;
    description = "terra";
    extraGroups = [ "networkmanager" "wheel" "docker" "tss" ];
    packages = with pkgs; [
      # Browsers
      # firefox
      (firefox.override { 
         nativeMessagingHosts = [ inputs.pipewire-screenaudio.packages.${pkgs.system}.default ]; 
      })
      brave
      chromium

      # Media
      mpv
      obs-studio
      imagemagick      
      libwebp
      yt-dlp 
 
      # Tools
      joplin-desktop
      blender
      unzip
      p7zip
      insync
      alacritty 
      discord
      slack
      keepassxc
      lazydocker
      btrfs-progs 
      fzf 
      util-linux
      tmsu
      file
      qbittorrent
      haskellPackages.greenclip
      wineWowPackages.full
      ncdu
      tpm2-tools

      # Desktop Env
      flameshot
      pasystray
      leftwm
      polybar
      pasystray
      networkmanagerapplet
      rofi
      pcmanfm
      arandr
      lxmenu-data
      dunst
      libnotify
      pulseaudio
      pamixer 
      pavucontrol
      feh
      gnome.adwaita-icon-theme
      wmctrl
      xclip
      redshift
      gnome.seahorse
      solaar

      # Dev
      vscode
      rustc
      rust-analyzer
      cargo
      nodejs

      # Random
      osu-lazer-bin

    ];
  };
  
  services.dbus.enable = true;
  services.gvfs.enable = true;

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
 
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;

  virtualisation.docker.liveRestore = false; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim
     wget
     git
     git-lfs
     htop
     btop
     neofetch
     tealdeer
  ];
   
 
  fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      proggyfonts
  ]; 
  
  programs.light.enable = true; 
  
  programs.neovim = {
     enable = true;
     vimAlias = true;
     viAlias = true;
     withNodeJs = true;
     defaultEditor = true;
  };
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
