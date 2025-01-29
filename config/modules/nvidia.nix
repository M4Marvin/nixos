{ config, lib, pkgs, ... }: {
  # Enable OpenGL
  hardware.graphics = { enable = true; };

  # Load NVIDIA driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  # NVIDIA configuration
  hardware.nvidia = {
    # Modesetting is required for proper display management
    modesetting.enable = true;

    # NVIDIA power management (experimental)
    powerManagement = {
      enable = true; # Disable if you experience issues with sleep/suspend
      finegrained = false; # Fine-grained power management (Turing+ GPUs only)
    };

    # Use the closed-source NVIDIA driver (default)
    open = false;

    # Enable the NVIDIA settings menu (`nvidia-settings`)
    nvidiaSettings = true;

    # Use the stable version of the NVIDIA driver
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Prime offloading configuration
    prime = {
      amdgpuBusId = "PCI:5:0:0"; # AMD CPU Bus ID
      nvidiaBusId = "PCI:1:0:0"; # NVIDIA GPU Bus ID
    };
  };

  # Optional: Blacklist the open-source `nouveau` driver
  boot.blacklistedKernelModules = [ "nouveau" ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix cursor issues
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
