{ config, pkgs, ... }:
{
    imports = [
        /homelab/hosts/.../hardware-configuration.nix
        /homelab/hosts/.../filesystem.nix

        /homelab/modules/default/configuration.nix
        /homelab/modules/default/firewall.nix
        /homelab/modules/default/ssh.nix

        /homelab/modules/users/admin.nix
        /homelab/modules/users/sam.nix

        # /homelab/modules/containers/
    ];

    # boot.supportedFilesystems = [ "" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "";
    networking.domain = "snowlab.io";

    security.sudo.enable = true;
    programs.bash.completion.enable = true;

    system.stateVersion = "";
    nixpkgs.system = "";  # x86_64-linux
    environment.systemPackages = with pkgs; [
    ];
}
