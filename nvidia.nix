{ config, pkgs, ... }: 
 { 
   # Environment variables 
  
   # Force wayland when possible 
   # environment.sessionVariables.NIXOS_OZONE_WL = "1"; 
  
   # Fix disappearing cursor on Hyprland 
   # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1"; 
  
   # Enable NVIDIA 
   services.xserver.videoDrivers = [ "nvidia" ]; 
   hardware.opengl = { 
     enable = true; 
     driSupport32Bit = true; 
   }; 
  
   hardware.nvidia = { 
     modesetting.enable = true; 
     powerManagement.enable = false; 
     powerManagement.finegrained = false; 
     open = false; 
     nvidiaSettings = true; 
     package = config.boot.kernelPackages.nvidiaPackages.beta; 
   }; 
 }
