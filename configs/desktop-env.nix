{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GDM DesktopManager
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Gnome Shell Extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.mpris-indicator-button
  ];

  # Gnome tweaks
  environment.systemPackages = with pkgs; [ gnome-tweaks ];

  # Keyboard Map
  services.xserver.layout = "us";

  # Enable touch pads
  services.xserver.libinput.enable = true;
}
