{ ... }:

{
  networking.hostName = "crepuscular-nixos"; # Define your hostname.

  networking.networkmanager.enable = true;
  # Configure proxy for using Qv2ray
  # networking.proxy.allProxy = "http://127.0.0.1:8889";
  # networking.proxy.noProxy = "127.0.0.1,localhost";
  
  users.users.crepuscular = {
    isNormalUser = true;
    home = "/home/crepuscular";
    description = "Crepuscular Hans"
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}
