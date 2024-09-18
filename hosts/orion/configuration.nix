{ config, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        # ./disko.nix
        ./modules/default-configuration.nix
        ./modules/containers/jellyfin.nix
        ./modules/users/admin.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "orion";
    networking.domain = "snowlab.io";

    time.timeZone = "America/New_York";

    security.sudo.enable = true;

    system.stateVersion = "24.05";

    nix = {
        package = pkgs.nixVersions.latest;
        settings.trusted-substituters = [
            "http://cache.nixos.org"
        ];

        settings.substituters = [
            "http://cache.nixos.org"
        ];

        gc.automatic = false;
    };

    nixpkgs = {
        system = "x86_64-linux";
        config = {
            allowUnfree = true;
        };
    };

    system.autoUpgrade = {
        enable = true;
        allowReboot = true;
    };

    programs.bash.enableCompletion = true;

    environment.systemPackages = with pkgs; [
        git
        neovim
    ];
}
