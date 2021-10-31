{ config, lib, pkgs, ... }:

{
  # Enable Intel Graphic Drivers
  services.xserver.videoDrivers = [ "intel" ];
}
