{config, lib, pkgs, ...}:

{
  # Target has bluetooth device so enable it
  hardware.bluetooth.enable = true;
  # hardware.bluetooth.hsphfpd.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.bluetooth.settings = {
    General.Experimental = "true";
    Policy.AudioEnable = "true";
  };
}
