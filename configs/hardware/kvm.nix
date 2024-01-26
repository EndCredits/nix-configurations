{ config, lib, pkgs, ... }:

{
  # Enable KVM for AMD CPU
  boot.kernelModules = [ "acpi_call" "kvm-amd" ];

  # KVM Software packages
  environment.systemPackages = with pkgs; [ qemu qemu_kvm iproute virtualbox ];

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  programs.virt-manager.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
}
