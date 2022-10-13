{ config, lib, pkgs, ... }:

{
  # Disable Systemd bootloader
  boot.loader.systemd-boot.enable = false;

  # Update Micro code for AMD CPU
  hardware.cpu.amd.updateMicrocode = true;

  # Boot kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

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
