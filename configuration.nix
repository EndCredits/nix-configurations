# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configs/bluetooth.nix
      ./configs/boot.nix
      ./configs/desktop-env.nix
      ./configs/general.nix
      ./configs/gpu-acceleration.nix
      ./configs/kvm.nix
      ./configs/user.nix
      ./configs/fonts.nix
      ./configs/vscode.nix
    ];
  # Set NixOS CN Mirror
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

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
    obs-studio
    file
    coreutils
    neovim
    git aria
    gcc gdb clang_15 clang-analyzer clang-tools cmake gnumake unzip
    postman
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
  ];  

  nixpkgs.config.permittedInsecurePackages = [
    "electron-14.2.9"
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
