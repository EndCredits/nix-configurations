{ config, lib, pkgs, ... }:

{
  # Enable AMD Graphic Drivers
  services.xserver.videoDrivers = [ "amdgpu" ];

  # For AMD Graphics Core Next (GCN) GPU Acceleration
  hardware.opengl.extraPackages = with pkgs; [ rocmPackages.clr.icd rocmPackages.clr amdvlk libvdpau-va-gl vaapiVdpau libva ];
  hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  
  # Force radv
  environment.variables.AMD_VULKAN_ICD = "RADV";

  # Enable accelerated OpenGL rendering through the Direct Rendering Interface
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
