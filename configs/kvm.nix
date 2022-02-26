{ config, lib, pkgs, ... }:

{
  # Enable KVM for AMD CPU
  boot.kernelModules = [ "acpi_call" "kvm-amd" ];

  # KVM Software packages
  environment.systemPackages = with pkgs; [ qemu qemu_kvm virt-manager iproute ];

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuOvmf = true;
}
