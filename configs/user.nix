{ ... }:

{
  networking.hostName = "x79-nixos"; # Define your hostname.

  networking.networkmanager.enable = true;
  # Configure proxy for using Qv2ray
  # networking.proxy.allProxy = "http://127.0.0.1:8889";
  # networking.proxy.noProxy = "127.0.0.1,localhost";

}
