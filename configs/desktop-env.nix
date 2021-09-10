{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GDM DesktopManager
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Gnome Shell Extensions
  environment.systemPackages = [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.mpris-indicator-button
  ];

  # Keyboard Map
  services.xserver.layout = "us";
};
