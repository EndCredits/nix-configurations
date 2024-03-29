{ config, lib, pkgs, ... }:

{
  # China Standard Time
  time.timeZone = "Asia/Shanghai";

  # Set Filesystem support
  boot.supportedFilesystems = [ "ntfs" "xfs" "btrfs" "f2fs" ];

  # CUPS Printing services
  services.printing.enable = true;

  # Sound Support
  sound.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.v2raya.enable = true;
}
