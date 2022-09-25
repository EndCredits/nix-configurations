{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/home/crepuscular/Working" =
    { device = "/dev/disk/by-uuid/eee20081-3b0a-43ca-854d-08cb7a77ad22";
      fsType = "btrfs";
    };
}
