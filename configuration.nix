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
    ];
  # Set NixOS CN Mirror
  nix.binaryCaches = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  # Allow non-free software
  nixpkgs.config = {
    allowUnfree = true;
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  environment.systemPackages = with pkgs; [
    wget
    neofetch htop
    netease-music-tui
    vlc
    obs-studio
    file
    coreutils
    vim
    vscode-with-extensions
    git aria
    gcc gdb clang clang-tools cmake
    vscode postman
    firefox
  ];

  # System Updates and Auto GC
   system.autoUpgrade.enable = false;
   nix.gc.automatic = true;
   nix.gc.dates = "05:15";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}
