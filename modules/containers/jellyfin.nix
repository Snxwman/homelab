{ config, pkgs, ... }:

{
  # Jellyfin
  virtualisation.oci-containers.containers."jellyfin" = {
    autoStart = true;
    image = "jellyfin/jellyfin";
    volumes = [
      "/jellyfin/config:/config"
      "/jellyfin/cache:/cache"
      "/jellyfin/log:/log"
      "/media/movies:/media/movies"
      "/media/series:/media/series"
    ];
    ports = [
        "8096:8096"
    ];
    environment = {
      JELLYFIN_LOG_DIR = "/log";
    };
  };

}
