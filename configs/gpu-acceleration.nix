{ config, lib, pkgs, ... }:

{
  # Enable Nvidia Graphic Drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable GDM Wayland session for Nvidia GPU
  services.xserver.displayManager.gdm.nvidiaWayland = true;
}
