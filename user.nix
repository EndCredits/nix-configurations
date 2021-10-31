{ ... }:

{
  networking.hostName = "g1-25-nixos"; # Define your hostname.

  networking.networkmanager.enable = true;
  # Configure proxy for using Qv2ray
  
  users.users.crepuscular = {
    isNormalUser = true;
    home = "/home/crepuscular";
    description = "Crepuscular";
    extraGroups = [ "wheel" "networkmanager" "podman" "docker" ];
  };
  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
