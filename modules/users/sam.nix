{ pkgs }:
{
    users.users.admin = {
        isNormalUser = true;
        name = "sam";
        uid = 1001;
        description = "Sam Kopp";

        # cryptHomeLuks = "";  # TODO:
        createHome = true;
        home = "/home/sam";
        homeMode = "700";
        
        useDefaultShell = true;  # TODO: switch to zsh
        hashedPasswordFile = /homelab/secrets/sam.passwd;

        group = "admin";
        extraGroups = [ 
            "wheel"
            "audio"
            "video"
            "docker"
        ];

        packages = with pkgs; [];
        
        programs.ssh.startAgent = true;
        openssh.authorizedKeys.keyFiles = [
            /homelab/secrets/io.snowlab_sam.pub
        ];
    };
}
