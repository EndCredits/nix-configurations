{ config, lib, pkgs, ... }:

{
  # Intel KVM Options for boot
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  # KVM Software packages
  environment.systemPackages = with pkgs; [ qemu qemu_kvm virt-manager iproute ];

  # Enable Podman
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuOvmf = true;
}
