{ config, lib, pkgs, ... }:

{
  # Disable Systemd bootloader
  boot.loader.systemd-boot.enable = false;

  # GRUB Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };
}
