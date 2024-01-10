# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configs/configs.nix
    ];

  # Trust me, I know what I'm doing
  nix.settings.trusted-users = [ "endcredits" ];

  # Allow non-free software
  nixpkgs.config = {
    allowUnfree = true;
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };
	
  environment.systemPackages = with pkgs; [
    artha
    wget iw
    neofetch
    vlc
    obs-studio grim
    file
    coreutils openssl openssl_legacy
    neovim
    dolphin
    git aria
    gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
    firefox
    google-chrome
    fuse ntfs3g
    fish
    tdesktop qq
    android-tools
    nodejs
    geogebra6
    python310 python310.pkgs.pip pipenv
    jadx meld
    go_1_20
    kitty kitty-themes
    yesplaymusic
    ffmpeg_6-full
    sublime4
    v2raya
  ];  

  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9" 
    "openssl-1.1.1t"
    "openssl-1.1.1w"
  ];

  # System Updates and Auto GC
   system.autoUpgrade.enable = false;
   nix.settings.auto-optimise-store = true;
   nix.gc.automatic = true;
   nix.gc.dates = "daily";
   nix.gc.options = "--delete-older-than 3d";

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}
