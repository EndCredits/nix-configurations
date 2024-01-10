{ config, lib, pkgs, ... }:

{
	imports = [
		# include hardware related features
		./hardware/bluetooth.nix
		./hardware/boot.nix
		./hardware/gpu-acceleration.nix
		./hardware/kvm.nix
		./hardware/partition.nix
		./hardware/user.nix

		# include user configured applications
		./applications/desktop-env.nix
		./applications/fonts.nix
		./applications/general.nix
		./applications/vscode.nix
	];
}
