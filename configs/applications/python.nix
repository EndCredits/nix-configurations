{ config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (subpkgs: with subpkgs; [
    	requests
	exceptiongroup
    	])
    )
    python3.pkgs.pip
    pipenv
    ];
}
