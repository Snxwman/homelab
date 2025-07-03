{ config, pkgs, ... }:
{
    imports = [
        /homelab/hosts/crux/hardware-configuration.nix
        /homelab/hosts/crux/filesystem.nix

        /homelab/modules/default/configuration.nix
        /homelab/modules/default/firewall.nix
        /homelab/modules/default/ssh.nix

        /homelab/modules/users/admin.nix
        /homelab/modules/users/sam.nix

        # /homelab/modules/containers/
    ];

    # boot.supportedFilesystems = [ "ntfs" ];

    networking.hostName = "crux";
    networking.domain = "snowlab.io";

    system.stateVersion = "24.11";
    nixpkgs.system = "x86_64-linux";  # x86_64-linux
    environment.systemPackages = with pkgs; [
    ];
}
