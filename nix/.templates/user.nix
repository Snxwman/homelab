{ pkgs, ... }:
{
    users.users.name = {
        isNormalUser = true;
        name = "";
        # uid = 1002;  # NOTE: Must be greater than 1002
        description = "";

        # cryptHomeLuks = "";  # TODO:
        createHome = true;
        home = "/home/...";
        homeMode = "700";

        useDefaultShell = true;
        hashedPasswordFile = "/homelab/secrets/";

        group = "admin";
        extraGroups = [
            "wheel"
            "audio"
            "video"
            "docker"
        ];

        packages = with pkgs; [];

        openssh.authorizedKeys.keyFiles = [
            # /homelab/secrets/
        ];
    };

    programs.ssh.startAgent = true;
}
