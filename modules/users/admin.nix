{ pkgs, ... }:
{
    users.groups.admin = {
        gid = 1000;
    };

    users.users.admin = {
        isNormalUser = true;
        name = "admin";
        uid = 1000;
        description = "Shared Admin Account";

        # cryptHomeLuks = "";  # TODO:
        createHome = true;
        home = "/home/admin";
        homeMode = "770";
        
        useDefaultShell = true;
        hashedPasswordFile = /homelab/secrets/admin.passwd;

        group = "admin";
        extraGroups = [ 
            "wheel"
            "audio"
            "video"
            "docker"
        ];

        packages = with pkgs; [];
        
        openssh.authorizedKeys.keyFiles = [
            /homelab/secrets/io.snowlab_admin.pub
        ];
    };
}
