{ config, pkgs, ... }:
{
    services.jellyfin.enable = true;
    services.jellyfin.openFirewall = true;
    environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
    ];
}
