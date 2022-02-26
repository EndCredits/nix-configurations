{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GDM DesktopManager
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Gnome Shell Extensions and packages
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.mpris-indicator-button
    gnome.gnome-tweaks
    ibus
    ibus-engines.rime
    gtk-engine-murrine
    gnome-themes-extra
  ];

  # Keyboard Map
  services.xserver.layout = "us";

  # Enable touch pads
  services.xserver.libinput.enable = true;

  # Enable ibus input method
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ rime ];
}
