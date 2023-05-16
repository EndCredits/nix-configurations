{ config, lib, pkgs, ... }:

{
  # Disable Systemd bootloader
  boot.loader.systemd-boot.enable = false;

  # Update Micro code for AMD CPU
  hardware.cpu.amd.updateMicrocode = true;

  # Boot kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # GRUB Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };
}
