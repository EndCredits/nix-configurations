{config, lib, pkgs,  ... }:

{
  networking.hostName = "crepuscular-nixos"; # Define your hostname.

  networking.networkmanager.enable = true;
  # Configure proxy for using Qv2ray
  # networking.proxy.allProxy = "http://127.0.0.1:8889";
  # networking.proxy.noProxy = "127.0.0.1,localhost";
  # networking.proxy.default = "http://192.168.2.126:9080";

  users.users = {
    endcredits = {
      isNormalUser = true;
      home = "/home/endcredits";
      description = "Crepuscular Hana";
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" "adbusers" "libvirtd" ];
    };
  };
  
  # Enable fish for the default shell
  programs.fish = {
    enable = true;
    useBabelfish = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };
  users.defaultUserShell = pkgs.fish;
}
