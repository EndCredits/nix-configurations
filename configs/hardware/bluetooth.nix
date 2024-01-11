{config, lib, pkgs, ...}:

{
  # Target has bluetooth device so enable it
  hardware.bluetooth.enable = true;
  # hardware.bluetooth.hsphfpd.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable blueman service
  services.blueman.enable = true;
}
